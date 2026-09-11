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
