# Script for launchig a simple EC2 instance  

terraform {
  required_providers {
    aws = {                                   # cloud provider
      source  = "hashicorp/aws"
      version = "~> 3.0"                      # version of provider
    }
  }
}

provider "aws" {
  region = "us-east-1"         # region of deployment
}

resource "aws_instance" "example" {  #aws_instance is the resource type and example is the local name which can be modified
  ami           = "ami-0b72821e2f351e396" # AMI corresponds to Amazon Linux 2023 // us-east-1
  instance_type = "t2.micro" # type of instance size
  
  tags = {
    Name = "Terraform-EC2" # used to name the EC2 instance
  }
}