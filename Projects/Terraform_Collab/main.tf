# Configure the AWS provider
provider "aws" {
  region = "us-east-1"         # region of deployment
}

# Create a VPC 
resource "aws_vpc" "terraform_collab_vpc" {
  cidr_block             = "10.0.0.0/16"
  enable_dns_support     = true
  enable_dns_hostnames   = true

  tags = {
    Name = "terraform-collab-vpc"
  }
}

# Create a Subnet
resource "aws_subnet" "terraform_collab_subnet" {
  vpc_id                  = aws_vpc.terraform_collab.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "terraform-collab-Subnet"
  }
}

# Create a IGW 
resource "aws_internet_gateway" "terraform_collab_igw" {
  vpc_id = aws_vpc.terraform_collab_vpc.id

  tags = {
    Name = "terraform-collab-IGW"
  }
}

# Create a RT 
resource "aws_route_table" "terraform_collab_route_table" {
  vpc_id = aws_vpc.terraform_collab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_collab_igw.id
  }

  tags = {
    Name = "terraform-collab-RT"
  }
}

# Create a RT association 
resource "aws_route_table_association" "terraform_collab_subnet_association" {
  subnet_id      = aws_subnet.terraform_collab_subnet.id
  route_table_id = aws_route_table.terraform_collab_route_table.id
}

# Create a SG 
resource "aws_security_group" "terraform_collab_sg" {
  vpc_id = aws_vpc.terraform_collab_vpc.id

  ingress {
    from_port   = 22              #ssh port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80               #http port
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443             #https port
    to_port     = 443
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
    Name = "terraform_collab-SG"
  }
}

# Create a EC2 using the AWS VPC module
resource "aws_instance" "terraform_collab_ec2" {     # aws_instance is the resource type and example is the local name which can be modified
  ami           = "ami-0b72821e2f351e396"            # AMI corresponds to Amazon Linux 2023 // us-east-1
  instance_type = "t2.micro"                         # type of instance size
  
  tags = {
    Name = "terraform-collab-ec2"                    # used to name the EC2 instance
  }
}