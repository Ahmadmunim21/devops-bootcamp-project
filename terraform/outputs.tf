output "current_aws_region" {
  description = "AWS region currently used by Terraform"
  value       = data.aws_region.current.name
}

output "availability_zone" {
  description = "Availability Zone used by the project"
  value       = data.aws_availability_zones.available.names[0]
}

output "vpc_id" {
  description = "ID of the DevOps Bootcamp VPC"
  value       = aws_vpc.devops_vpc.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.devops_vpc.cidr_block
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public.id
}

output "public_subnet_cidr" {
  description = "Public subnet CIDR"
  value       = aws_subnet.public.cidr_block
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private.id
}

output "private_subnet_cidr" {
  description = "Private subnet CIDR"
  value       = aws_subnet.private.cidr_block
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.devops_igw.id
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.devops_ngw.id
}

output "nat_gateway_public_ip" {
  description = "Elastic IP attached to the NAT Gateway"
  value       = aws_eip.nat.public_ip
}

output "public_route_table_id" {
  description = "Public route table ID"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "Private route table ID"
  value       = aws_route_table.private.id
}

output "public_security_group_id" {
  description = "Security group ID for public web server"
  value       = aws_security_group.public.id
}

output "private_security_group_id" {
  description = "Security group ID for private servers"
  value       = aws_security_group.private.id
}

output "ubuntu_ami_id" {
  description = "Ubuntu AMI used by EC2 servers"
  value       = data.aws_ami.ubuntu.id
}

output "web_instance_id" {
  description = "EC2 instance ID of the web server"
  value       = aws_instance.web.id
}

output "web_private_ip" {
  description = "Private IP of the web server"
  value       = aws_instance.web.private_ip
}

output "web_public_ip" {
  description = "Elastic IP of the web server"
  value       = aws_eip.web.public_ip
}

output "controller_instance_id" {
  description = "EC2 instance ID of the Ansible controller"
  value       = aws_instance.controller.id
}

output "controller_private_ip" {
  description = "Private IP of the Ansible controller"
  value       = aws_instance.controller.private_ip
}

output "monitoring_instance_id" {
  description = "EC2 instance ID of the monitoring server"
  value       = aws_instance.monitoring.id
}

output "monitoring_private_ip" {
  description = "Private IP of the monitoring server"
  value       = aws_instance.monitoring.private_ip
}

output "instance_ids" {
  description = "EC2 instance IDs used by the project"

  value = {
    web        = aws_instance.web.id
    controller = aws_instance.controller.id
    monitoring = aws_instance.monitoring.id
  }
}
