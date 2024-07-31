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
  default     = "xxx"
}


variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
  default     = "xxx"


variable "vpc_cidr" {
  description = "The cidr block of the vpc"
  type        = string
  default     = "xxx"