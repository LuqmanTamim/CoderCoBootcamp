variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance"
  type        = string
  default     = "WordPress-key-pair"
}

variable "subnet_cidr" {
  description = "The cidr block of the subnet"
  type        = string
  default     = "10.0.1.0/24"
}


variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}


variable "vpc_cidr" {
  description = "The cidr block of the vpc"
  type        = string
  default     = "10.0.0.0/16"
  }


 variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
} 