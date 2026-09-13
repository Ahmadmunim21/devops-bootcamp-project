variable "vpc_cidr" {
  description = "CIDR block for the DevOps Bootcamp VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.0.0/25"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.0.128/25"
}

variable "web_instance_type" {
  description = "EC2 instance type for the web server"
  type        = string
  default     = "t3.micro"
}

variable "controller_instance_type" {
  description = "EC2 instance type for the Ansible controller"
  type        = string
  default     = "t3.micro"
}

variable "monitoring_instance_type" {
  description = "EC2 instance type for the monitoring server"
  type        = string
  default     = "t3.micro"
}

variable "github_repository" {
  description = "GitHub repository allowed to assume the CI/CD IAM role"
  type        = string
}
