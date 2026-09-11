terraform {
  backend "s3" {
    bucket       = "devops-bootcamp-terraform-munim"
    key          = "main/terraform.tfstate"
    region       = "ap-southeast-1"
    encrypt      = true
    use_lockfile = true
  }
}
