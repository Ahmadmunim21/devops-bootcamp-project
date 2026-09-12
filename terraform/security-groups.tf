# ============================================================
# PUBLIC SECURITY GROUP
# Used by Web Server: 10.0.0.5
# ============================================================

resource "aws_security_group" "public" {
  name        = "devops-public-sg"
  description = "Security group for DevOps Bootcamp public web server"
  vpc_id      = aws_vpc.devops_vpc.id

  tags = {
    Name = "devops-public-sg"
  }
}

# Application HTTP access from Internet
resource "aws_vpc_security_group_ingress_rule" "public_http" {
  security_group_id = aws_security_group.public.id
  description       = "Allow HTTP from Internet"

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

# SSH is NOT exposed to Internet.
# Controller can later reach the web server through the VPC.
resource "aws_vpc_security_group_ingress_rule" "public_ssh_from_vpc" {
  security_group_id = aws_security_group.public.id
  description       = "Allow SSH from DevOps VPC only"

  cidr_ipv4   = var.vpc_cidr
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

# Prometheus on monitoring server 10.0.0.136 will scrape node_exporter
resource "aws_vpc_security_group_ingress_rule" "public_node_exporter" {
  security_group_id = aws_security_group.public.id
  description       = "Allow node exporter from monitoring server only"

  cidr_ipv4   = "10.0.0.136/32"
  from_port   = 9100
  ip_protocol = "tcp"
  to_port     = 9100
}

resource "aws_vpc_security_group_egress_rule" "public_all_outbound" {
  security_group_id = aws_security_group.public.id
  description       = "Allow outbound IPv4 traffic"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}


# ============================================================
# PRIVATE SECURITY GROUP
# Used by:
#   Ansible Controller: 10.0.0.135
#   Monitoring Server:  10.0.0.136
# ============================================================

resource "aws_security_group" "private" {
  name        = "devops-private-sg"
  description = "Security group for DevOps Bootcamp private servers"
  vpc_id      = aws_vpc.devops_vpc.id

  tags = {
    Name = "devops-private-sg"
  }
}

# SSH only from inside the DevOps VPC
resource "aws_vpc_security_group_ingress_rule" "private_ssh_from_vpc" {
  security_group_id = aws_security_group.private.id
  description       = "Allow SSH from DevOps VPC only"

  cidr_ipv4   = var.vpc_cidr
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

# Private instances need outbound Internet access through NAT
resource "aws_vpc_security_group_egress_rule" "private_all_outbound" {
  security_group_id = aws_security_group.private.id
  description       = "Allow outbound IPv4 traffic via NAT Gateway"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
