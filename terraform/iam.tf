locals {
  server_roles = toset([
    "web",
    "controller",
    "monitoring"
  ])
}

# Separate IAM role for each EC2 server
resource "aws_iam_role" "ec2" {
  for_each = local.server_roles

  name = "devops-${each.key}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "devops-${each.key}-role"
  }
}

# Allow every server to register with AWS Systems Manager
resource "aws_iam_role_policy_attachment" "ssm_core" {
  for_each = local.server_roles

  role       = aws_iam_role.ec2[each.key].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Instance profiles used by EC2
resource "aws_iam_instance_profile" "ec2" {
  for_each = local.server_roles

  name = "devops-${each.key}-profile"
  role = aws_iam_role.ec2[each.key].name
}
