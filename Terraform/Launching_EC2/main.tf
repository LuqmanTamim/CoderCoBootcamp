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

resource "aws_instance" "example" {   # example is the name of ec2 isnatnce
  ami           = "ami-011899242bb902164" # AMI corresponds to Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro" # type of instance size
}