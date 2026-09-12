# ============================================================
# WEB SERVER
# Public subnet
# Fixed private IP: 10.0.0.5
# ============================================================

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.web_instance_type

  subnet_id  = aws_subnet.public.id
  private_ip = "10.0.0.5"

  vpc_security_group_ids = [
    aws_security_group.public.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2["web"].name

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 12
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "devops-web-server"
    Role = "Web"
  }
}


# ============================================================
# ANSIBLE CONTROLLER
# Private subnet
# Fixed private IP: 10.0.0.135
# ============================================================

resource "aws_instance" "controller" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.controller_instance_type

  subnet_id  = aws_subnet.private.id
  private_ip = "10.0.0.135"

  vpc_security_group_ids = [
    aws_security_group.private.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2["controller"].name

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 12
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "devops-ansible-controller"
    Role = "AnsibleController"
  }
}


# ============================================================
# MONITORING SERVER
# Private subnet
# Fixed private IP: 10.0.0.136
# ============================================================

resource "aws_instance" "monitoring" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.monitoring_instance_type

  subnet_id  = aws_subnet.private.id
  private_ip = "10.0.0.136"

  vpc_security_group_ids = [
    aws_security_group.private.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2["monitoring"].name

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 12
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "devops-monitoring-server"
    Role = "Monitoring"
  }
}


# ============================================================
# ELASTIC IP FOR WEB SERVER
# ============================================================

resource "aws_eip" "web" {
  domain = "vpc"

  tags = {
    Name = "devops-web-eip"
  }
}

resource "aws_eip_association" "web" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.web.id
}
