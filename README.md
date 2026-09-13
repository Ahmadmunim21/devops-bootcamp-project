# DevOps Bootcamp Final Project

Devops Bootcamp Project using:

- AWS
- Terraform
- Ansible
- Docker
- Amazon ECR
- Prometheus
- Grafana
- Cloudflare
- GitHub Actions

## Architecture

The project will provision an AWS environment containing:

- VPC
- Public subnet
- Private subnet
- Internet Gateway
- NAT Gateway
- Security Groups
- Web Server
- Ansible Controller
- Monitoring Server
- Amazon ECR
- Terraform remote state in Amazon S3

## Project Status

### Phase 0
- [x] Repository initialized
- [x] AWS CLI configured
- [x] Terraform configured

### Phase 1
- [x] Terraform S3 remote backend
- [x] S3 versioning
- [x] S3 encryption
- [x] S3 public access blocking

### Phase 2
- [x] VPC 10.0.0.0/24
- [x] Public subnet 10.0.0.0/25
- [x] Private subnet 10.0.0.128/25
- [x] Internet Gateway
- [x] NAT Gateway
- [x] Public route table
- [x] Private route table

### Phase 3 - Security Groups

- [x] Public security group created
- [x] Private security group created
- [x] Security groups managed using Terraform
- [x] HTTP access configured for the web application
- [x] Private EC2 instances protected from direct public access
- [x] Server administration uses AWS Systems Manager instead of public SSH

### Phase 4 - EC2, IAM & Systems Manager

- [x] Web EC2 instance deployed
- [x] Controller EC2 instance deployed
- [x] Monitoring EC2 instance deployed
- [x] EC2 instances provisioned using Terraform
- [x] Controller and monitoring servers deployed in private subnet
- [x] IAM instance profiles attached to EC2 instances
- [x] AWS Systems Manager configured for remote administration
- [x] SSM connectivity verified
- [x] Private servers administered without public SSH access

### Phase 5 - Configuration Management

- [x] Ansible installed on private controller
- [x] Controller private IP: 10.0.0.135
- [x] Web server inventory target: 10.0.0.5
- [x] Monitoring inventory target: 10.0.0.136
- [x] Controller-to-target SSH configured
- [x] Ansible ping successful
- [x] Docker installed using Ansible
- [x] Docker service enabled
- [x] Ansible playbook verified as idempotent

### Phase 6 - Docker & ECR

- [x] Docker installed on target server using Ansible
- [x] Application Docker image built successfully
- [x] Multi-stage Dockerfile used
- [x] Private Amazon ECR repository configured
- [x] Docker image pushed to Amazon ECR
- [x] Application deployed from ECR to Web EC2 using Ansible
- [x] Application container exposed on port 80
- [x] Application accessible through the web server
- [x] Ansible deployment verified as idempotent

### Phase 7 - Monitoring & Observability

- [x] Node Exporter deployed on web server
- [x] Prometheus deployed on monitoring server
- [x] Grafana deployed on monitoring server
- [x] Prometheus configured to scrape web-server metrics
- [x] Prometheus target verified as UP
- [x] Grafana dashboard available
- [x] Monitoring stack deployed using Ansible
- [x] Ansible deployment verified as idempotent
- [x] Monitoring server remains private

### Phase 8 - Domain & Secure Access

- [x] Cloudflare-managed domain
- [x] Web application: https://web.ahmadmunim.asia
- [x] Cloudflare proxied DNS
- [x] Cloudflare Tunnel deployed
- [x] Monitoring URL: https://monitoring.ahmadmunim.asia
- [x] Grafana available through Cloudflare Tunnel
- [x] Monitoring EC2 has no public IP
- [x] Grafana port 3000 is not publicly exposed
- [x] Prometheus port 9090 is not publicly exposed
- [x] cloudflared installed using Ansible

### Phase 9 - CI/CD & Documentation

- [x] GitHub Actions CI/CD workflow created
- [x] GitHub OIDC authentication with AWS configured
- [x] Temporary AWS credentials used without long-lived AWS keys
- [x] Application Docker image built and tested in CI
- [x] Application image pushed to Amazon ECR
- [x] Application deployed through Ansible Controller
- [x] Production website verified after deployment
- [ ] GitHub Pages documentation
- [ ] Custom documentation domain
