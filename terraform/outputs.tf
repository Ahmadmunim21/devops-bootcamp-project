output "current_aws_region" {
  description = "AWS region currently used by Terraform"
  value       = data.aws_region.current.name
}
