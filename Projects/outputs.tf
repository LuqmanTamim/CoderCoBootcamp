output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.wordpress_infrastructure.vpc_id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = module.wordpress_infrastructure.subnet_id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.wordpress_infrastructure.instance_id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = module.wordpress_infrastructure.instance_public_ip
}
