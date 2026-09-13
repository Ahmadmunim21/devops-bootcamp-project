# ============================================================
# GitHub Actions OpenID Connect Provider
# ============================================================

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  tags = {
    Name = "github-actions-oidc"
  }
}


# ============================================================
# GitHub Actions IAM Role
#
# Only this repository's MAIN branch may assume this role.
# No long-lived AWS access keys are stored in GitHub.
# ============================================================

resource "aws_iam_role" "github_actions" {
  name = "devops-bootcamp-github-actions"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }

        Action = "sts:AssumeRoleWithWebIdentity"

        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }

          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:Ahmadmunim21@192777945/devops-bootcamp-project@1366256185:ref:refs/heads/main"
          }
        }
      }
    ]
  })

  tags = {
    Name = "devops-bootcamp-github-actions"
  }
}


# ============================================================
# GitHub Actions ECR permissions
# Build and push application images only to our repository
# ============================================================

resource "aws_iam_role_policy" "github_actions_ecr" {
  name = "devops-github-actions-ecr"
  role = aws_iam_role.github_actions.id

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
# GitHub Actions SSM permissions
#
# GitHub may trigger deployment ONLY through our
# Ansible Controller EC2 instance.
# ============================================================

resource "aws_iam_role_policy" "github_actions_ssm" {
  name = "devops-github-actions-ssm"
  role = aws_iam_role.github_actions.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "RunDeploymentOnController"
        Effect = "Allow"

        Action = [
          "ssm:SendCommand"
        ]

        Resource = [
          "arn:aws:ssm:ap-southeast-1::document/AWS-RunShellScript",
          "arn:aws:ec2:ap-southeast-1:${data.aws_caller_identity.current.account_id}:instance/${aws_instance.controller.id}"
        ]
      },

      {
        Sid    = "ReadDeploymentStatus"
        Effect = "Allow"

        Action = [
          "ssm:GetCommandInvocation",
          "ssm:ListCommandInvocations",
          "ssm:ListCommands"
        ]

        Resource = "*"
      }
    ]
  })
}
