variable "aws_region" {
  description = "AWS region untuk DevOps Bootcamp project"
  type        = string
  default     = "ap-southeast-1"
}

variable "state_bucket" {
  description = "S3 bucket simpan Terraform state"
  type        = string
}
