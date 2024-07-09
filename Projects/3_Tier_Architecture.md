# 3 Tier Architecture on AWS using a LAMP stack (Linux, Apache, MySQL, PHP)

### Introduction

##### This project looks to deploy a Dynamic WorPress site onto an EC2 instance using a LAMP stack. The site will be secured due to the configuring of a VPC, Subnet, Security Group, InternetGateway, Route tables creating a highly secure, high performace and scalable WordPress site.

### What is a LAMP stack?

##### A LAMP stack is a group of software, which is open-source, and are installed on an instance. Together they allow the EC2 instance to host a dynamic website and in this case, WordPress. LAMP stands for Linux as the OS, Apacahe for the web server, MySQL for the database and PHP used as a server-side scripting language.

##### The data will be stored in MariaDB databse which will replace MySQL due to it's opensource nature, better performance and increased scalability and security. 

### What is WordPress?

##### WordPress is a open-source content management software (CMS) Which allows users to create, organise and publish content on the web. It is easy to use and integrates well with a LAMP stack.

## Steps for Creating EC2 instance, VPC, Subnet, Security group, Key Pair, Internet Gateway and Route table

### Step 1 - Creating an IAM user

If you already have a IAM user with admin permission thatr you can use than skip to Step 2

1. Login to the console and in the search bar on the top right search IAM
2. On the left tab nagivate to Access managament > Users > Toggle Create user
- Name the user a descriptive name such as "Admin-'YourName'"
- Toggle Next > Attach policies directly, and attch the AdministratorAccess policy
- Toggle Next > Create user
- Login to the user that was just created

### Step 2 - Create a Key Pair

A key pair

1. Navigate to the EC2 console
2. In the left-hand pane Toggle Key Pairs under Network & Security
3. Toggle Create key pair
- Insert a descriptive name such as "WordPress-KeyPair"
- Choose RSA for Key pair type
- Toggle on .pem as we will be using SSH to securely access the EC2 instance (.ppk is for putty use i.e for Windows 10 and lower)
- Toggle Create key pair
- Save the Key pair in a directory that is memorable as we will have tpo access the directory when SSHing into the EC2 instance

### Step 3 - Create a VPC

1. Navigate to the search bar and type and access the VPC console
2. Toggle Create VPC 
3. Configure the settings:
- Toggle VPC only for Resources to Create
- Name the VPC with a descriptive name "WordPress-VPC"
- IPv4 CIDR block: 10.0.0.0/16
- IPv6 CIDR block: No IPv6 CIDR block
- Toggle Create VPC

### Step 4 - Create a Subnet

1. Navigate to the VPC console
2. On the left pane toggle Subnets under Virtual private cloud
3. Toggle Create subnet
4. Configure the settings:
- Select the VPC that was created from the VPC ID drop down list
- Enter a Subnet name such as "WordPress-Subnet"
- Choose any Availability Zone
- To reduce the amount of IP addresses choose the IPv4 subnet CIDR block to be 10.0.0.0/24
- Toggle Create subnet

### Step 5 - Create an Internet Gateway

1. Navigate to the VPC console
2. On the left pane toggle Internet gateways under Virtual private cloud
3. Toggle Create internet gateway
4. Configure the settings:
- Insert a name tag such as "WordPress-IGW"
- Toggle Create internet gateway
- Toggle Actions > Attach to VPC
- Select the VPC that was created and toggle Attach Internet Gateway

### Step 6 - Create a Route Table

1. Navigate to the VPC console
2. On the left pane toggle Route tables under Virtual private cloud
3. Toggle Create route table s
4. Configure the settings:
- Name the Route table such as "WordPress-RT"
- Select the VPC that was created i.e WorPress-VPC
5. Toggle Route table check box
6. Toggle Actions > Edit subnet associations
7. Attach WordPress-Subnet and toggle Save associations
8. Toggle Route table check box
9. Toggle Actions > Edit routes
10. Toggle Add route > Destination > 0.0.0.0/0
11. Toggle Target > Internet Gateway that was created WordPress-IGW
12. Toggle Save changes

### Step 7 - Create a Security Group

Security Group acts as a Firewall at the instance level and will only allow inbound and outbound traffic according to what rules are applied.

1. Access the EC2 console
2. In the left pane under Network & Security toggle Security Groups
3. Toggle Create security group
4. Configure the settings:
- Enter a descriptive name such as "WordPress-EC2-SG"
- For the Description write: Security Group for EC2 instance to host WordPress site
- For VPC attach the VPC that was created WordPress-VPC
5. On inbound rules Toggle add rule:
-  Toggle type > SHH (Port 22) , Source > Anywhere-IPv4, CIDR blocks > 0.0.0.0/0
-  Toggle type > HTTP (Port 80) , Source > Anywhere-IPv4, CIDR blocks > 0.0.0.0/0
-  Toggle type > HTTPS (Port 443) , Source > Anywhere-IPv4, CIDR blocks > 0.0.0.0/0

### Step 8 - Create the EC2 instance

1. Access the EC2 console
2. On the Launch instance section, toggle Launch instance
3. Configure the settings:
- Name the instance WordPress-EC2
- AMI > Amazon Linux (OS)
- Instance type > t2.micro (Free tier eligilble) 
- Key pair > WordPress-KeyPair
- Network settings > Edit , VPC > WordPress-VPC
, Subnet > WordPress-Subnet, Auto-assign public IP > Enable , Firewall (security groups) > Select existing security group > WordPress-EC2-SG
- Toggle Launch instance


## Steps SSH into EC2 instance 

### What is SSH?

###### SSH is a secure shell used to connect and access a EC2 instance securely using the CLI 

### Steps for connecting via SSH

1. Navigate to the EC2 console
2. Toggle the checkbox for the EC2 instance WordPress-EC2
3. Toggle Connect
4. Toggle SSH client tab
5. Open a SHH client on your computer (Git bash, Powershell, MacOS, Windows etc)
6. cd into the directory that contains the WordPress-KeyPair
7. Run the following command: ``` chmod 400 your-key-pair-name (tutorial-ec2-key-pair.pem) ```
8. Connect to your instance using its Public DNS: Eg. ``` ssh -i “your-key-pair-name.pem” ec2-user@ec2-ip-address-region.compute.amazonaws.com ```
9. Enter ``` yes ``` when asked would you like to continue connecting 

The EC2 instance is now accessed through the CLI 

## Intalling LAMP stack 

### Step1: Installing Apache, MariaDB and PHP

1. Make sure you have SSH into the insatnce
2. Update the software on the WordPress-EC2, the dnf command is used to install multiple software packages
``` sudo dnf update -y ```
3. Install Apache web server and PHP 
``` sudo dnf install -y httpd wget php-fpm php-mysqli php-json php php-devel ```
4. Install MariaDB
``` sudo dnf install mariadb105-server -y```
5. Start Apache web server using:
``` sudo systemctl start httpd ```
6. Enable the Apache web server:
``` sudo systemctl enable httpd ```
Verify if Apache is enabled using either
``` sudo systemctl is-enabled httpd ``` Where the code will write "enabled" or ``` sudo systemctl status httpd ``` which will check the status and write "enabled". To exit this press Esc on keyboard followed by ``` :q! ```
7. The web server should be running and we can test this by, navigating to the instance on the AWS console and by toggling Public IPv4 DNS. Check to see if the URL has HTTPS, if so, change it to HTTP. The Apache web page should display "It works!"

### Step 2: Set file permissions

##### To allow the EC2 user to manipulate files in Apache through the root directory (/var/www/html) the directory's ownership and permissions shoule be modified. 

1. Add the ec2-user (the user we are using) to the Apache group
``` sudo usermod -a -G apache ec2-user ```
2. Log out of the instance by using command ``` exit``` then SSH back into the instance so the Apache group can pick up the new update
3. Verify that  the ec2-user has been added
``` groups ``` 
The output on the terminal should be ``` ec2-user adm wheel apache systemd-journal ```
4. Change the group ownership of the root directory and its conetnts
``` sudo chown -R ec2-user:apache /var/www ```
5. Change the directory permission to add group write permissions and to set group ID on future subdirectories:
``` sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \; ```

``` find /var/www -type f -exec sudo chmod 0664 {} \; ```

The user (ec2-user) and any other memebers added to the Apache group can add, delete, and edit files in the Apache root directory. This now allows the users of the group to add content. In our case a WordPress site via PHP.

### Step 3: Test the LAMP server

##### In order to view content we must add it to the Apache root directory (/var/www/html) which we can display via the public DNS address for our EC2 instance. 

1. Create a PHP file in the Apache document root file (/var/www/html) 
``` echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php ```
2. On your insatnce information on the AWS console open the instance using Public IPv4 DNS, and type /phpinfo.php at the end. So it should look like this: http://my.public.dns.amazonaws.com/phpinfo.php

Now you should see the PHP information page
3. Due to security reasons the PHP information should not be accessible via the internet so we must remove it 
```rm /var/www/html/phpinfo.php ```

### Step 4: Securing the database

##### The data base can be secured by adding a root password and removing the insecure installation features from the install.

1. Start the MariaDB server using systemctl command
``` sudo systemctl start mariadb ```
2. Enable the MariaDB server using systemctl command
``` sudo systemctl enable mariadb ```
3. Run 
``` sudo mysql_secure_installation ```
- When prompted with the root password press Enter on your keyboard. This is because we have not set a root passowrd and by default the root account doesnt have a password.
- When asked ``` Switch to unix_socket authentication [Y/n] ``` Type ``` Y ``` 
-  When asked ``` Change the root password? ``` Type ``` Y ```. Note this password soemwhere where you can remember it. For example Notes
- We aim to not use the root user so we will create a database user as it is best practice.
- Type ``` Y ``` to remove the anonymous user accounts
- Type ``` Y ``` to disable the remote root login
- Type ``` Y ``` to remove the test database
- Type ``` Y ``` to reload the privilege tables and save your changes

