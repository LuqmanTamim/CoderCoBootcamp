provider "aws" {
  region = var.region
}

resource "aws_vpc" "WordPress_vpc_TF" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "WordPress-vpc-TF"
  }
}

resource "aws_subnet" "WordPress_subnet_TF" {
  vpc_id                  = aws_vpc.WordPress-vpc-TF.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "WordPress-subnet-TF"
  }
}

resource "aws_internet_gateway" "WordPress_igw_TF" {
  vpc_id = aws_vpc.WordPress-vpc-TF.id
  tags = {
    Name = "WordPress-igw-TF"
  }
}

resource "aws_route_table" "WordPress_rt_TF" {
  vpc_id = aws_vpc.WordPress_vpc_TF

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.WordPress_igw_TF.id
  }

  tags = {
    Name = "WordPress-rt-TF"
  }
}

resource "aws_route_table_association" "WordPress_rta_TF" {
  subnet_id      = aws_subnet.WordPress_subnet_TF.id
  route_table_id = aws_route_table.WordPress_rt_TF.id
}

resource "aws_security_group" "WordPress_sg_TF" {
  vpc_id = aws_vpc.WordPress_vpc_TF.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WordPress-sg-TF"
  }
}

locals {
  instance_names = ["WordPressInstance"]
}


resource "aws_instance" "wordpress_EC2" {
  for_each               = toset(local.instance_names)
  ami                    = "ami-0427090fd1714168b"  # Amazon Linux 2 AMI for us-east-1
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.WordPress_subnet_TF.id
  vpc_security_group_ids = [aws_security_group.WordPress_sg_TF.id]
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash

    # Install Nginx
    sudo yum update
    sudo yum -y install nginx
    
    # Start and enable Nginx
    sudo systemctl start nginx
    Sleep 10
    sudo systemctl enable nginx
    Sleep 10

    # Install PHP and necessary extensions
    sudo yum install php8.3-mysqlnd -y

    # Start and enable PHP-FPM
    sudo systemctl start php-fpm
    sudo systemctl enable php-fpm

    # Install MariaDB
    sudo yum install -y mariadb105-server mariadb105

    # Start and enable MariaDB
    sudo systemctl start mariadb
    sudo systemctl enable mariadb

    # Secure MariaDB installation (automated for this example)
    sudo mysql -e "UPDATE mysql.user SET Password=PASSWORD('LuqmansPassword') WHERE User='root';"
    sudo mysql -e "DELETE FROM mysql.user WHERE User='';"
    sudo mysql -e "DROP DATABASE test;"
    sudo mysql -e "FLUSH PRIVILEGES;"

    # Create WordPress database and user
    sudo mysql -u root -pLuqmansPassword -e "CREATE DATABASE wordpress;"
    sudo mysql -u root -pLuqmansPassword -e "CREATE USER 'wp_luqman'@'localhost' IDENTIFIED BY 'LuqmansPassword';"
    sudo mysql -u root -pLuqmansPassword -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_luqman'@'localhost';"
    sudo mysql -u root -pLuqmansPassword -e "FLUSH PRIVILEGES;"

    # Download and extract WordPress
    cd /var/www/html
    sudo wget https://wordpress.org/latest.tar.gz
    sudo tar -xzf latest.tar.gz
    sudo mv wordpress/* .
    sudo rm -rf wordpress latest.tar.gz

    # Set permissions
    sudo chown -R nginx:nginx /var/www/html
    sudo find /var/www/html/ -type d -exec chmod 755 {} \;
    sudo find /var/www/html/ -type f -exec chmod 644 {} \;

    # Configure wp-config.php
    sudo cp wp-config-sample.php wp-config.php
    sudo sed -i "s/database_name_here/wordpress/" wp-config.php
    sudo sed -i "s/username_here/wp_luqman/" wp-config.php
    sudo sed -i "s/password_here/LuqmansPassword/" wp-config.php
    
    # Create Nginx configuration for WordPress
    sudo bash -c 'cat <<EOT > /etc/nginx/conf.d/wordpress.conf
    server {
        listen 80;
        server_name 3.8.22.187; #My public ec2 IP address
        root /var/www/html;
        index index.php index.html index.htm;
        location / {
            try_files \$uri \$uri/ /index.php?\$args;
        }
        location ~ \.php$ {
            include /etc/nginx/fastcgi_params;
            fastcgi_pass unix:/var/run/php-fpm/www.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        }
        location ~ /\.ht {
            deny all;
        }
    }
    EOT'
    # Restart Nginx
    sudo systemctl restart nginx
  EOF

  tags = {
    Name = "WordPressInstance"
  }
}

