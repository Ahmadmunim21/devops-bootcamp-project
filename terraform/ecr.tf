# ============================================================
# PRIVATE AMAZON ECR REPOSITORY
# Stores the DevOps Bootcamp application Docker image
# ============================================================

resource "aws_ecr_repository" "app" {
  name                 = "devops-bootcamp-project"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name = "devops-bootcamp-project"
  }
}


# ============================================================
# CONTROLLER ECR PERMISSIONS
# Controller builds and pushes images
# ============================================================

resource "aws_iam_role_policy" "controller_ecr_push" {
  name = "devops-controller-ecr-push"
  role = aws_iam_role.ec2["controller"].name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid      = "ECRAuthentication"
        Effect   = "Allow"
        Action   = "ecr:GetAuthorizationToken"
        Resource = "*"
      },
      {
        Sid    = "PushApplicationImage"
        Effect = "Allow"

        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart",
          "ecr:BatchGetImage"
        ]

        Resource = aws_ecr_repository.app.arn
      }
    ]
  })
}


# ============================================================
# WEB SERVER ECR PERMISSIONS
# Web server only needs to pull images
# ============================================================

resource "aws_iam_role_policy" "web_ecr_pull" {
  name = "devops-web-ecr-pull"
  role = aws_iam_role.ec2["web"].name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid      = "ECRAuthentication"
        Effect   = "Allow"
        Action   = "ecr:GetAuthorizationToken"
        Resource = "*"
      },
      {
        Sid    = "PullApplicationImage"
        Effect = "Allow"

        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]

        Resource = aws_ecr_repository.app.arn
      }
    ]
  })
}
