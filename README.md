# DevOps Bootcamp Final Project

## Project Overview

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

The project is deployed in AWS Region `ap-southeast-1` using Terraform, Ansible, Docker, Amazon ECR, Prometheus, Grafana, Cloudflare, and GitHub Actions.

                           Internet
                              |
                    +---------+---------+
                    |                   |
          web.ahmadmunim.asia   monitoring.ahmadmunim.asia
                    |                   |
              Cloudflare DNS       Cloudflare Tunnel
                    |                   |
               Elastic IP               |
                    |                   |
                    v                   v
          +------------------+   +----------------------+
          | Web EC2          |   | Monitoring EC2       |
          | 10.0.0.5         |   | 10.0.0.136           |
          | Public Subnet    |   | Private Subnet       |
          |                  |   |                      |
          | Docker App       |   | Prometheus           |
          | Node Exporter    |   | Grafana              |
          +------------------+   +----------------------+
                    ^                    ^
                    |                    |
                    +---------+----------+
                              |
                     +-------------------+
                     | Ansible Controller|
                     | 10.0.0.135        |
                     | Private Subnet    |
                     +-------------------+
                              ^
                              |
                    AWS Systems Manager
                              |
                       Administrator


## Repository Structure

```
devops-bootcamp-project/
├── .github/
│   └── workflows/
├── ansible/
├── app/
├── monitoring/
├── terraform/
└── README.md

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

### Phase 9 - CI/CD Automation

- [x] GitHub Actions configured
- [x] AWS authentication uses GitHub OIDC
- [x] No long-lived AWS access keys stored in GitHub
- [x] Docker image automatically built
- [x] Container health tested during CI
- [x] Docker image automatically pushed to private Amazon ECR
- [x] Images tagged using Git commit SHA
- [x] `latest` application image maintained
- [x] GitHub Actions triggers deployment through AWS Systems Manager
- [x] Deployment executed from the Ansible Controller
- [x] Web Server deployment performed using Ansible
- [x] Production URL automatically health checked
- [x] Terraform formatting automatically checked
- [x] Terraform configuration automatically validated
- [ ] GitHub Pages documentation
- [ ] Custom documentation domain

## Security Design

- AWS Systems Manager is used for server administration.
- Controller and monitoring EC2 instances have no public IP addresses.
- Grafana is accessed through Cloudflare Tunnel.
- Grafana port 3000 is not publicly exposed.
- Prometheus port 9090 is not publicly exposed.
- GitHub Actions authenticates to AWS using OIDC.
- No long-lived AWS credentials are stored in GitHub.
- IAM permissions are separated by server and workload requirements.

## Live Project URLs

- Web Application: https://web.ahmadmunim.asia
- Monitoring: https://monitoring.ahmadmunim.asia
- Repository: https://github.com/Ahmadmunim21/devops-bootcamp-project
- Documentation: https://docs.ahmadmunim.asia

## Grafana Access

- URL: https://monitoring.ahmadmunim.asia
- Username: `devops-bootcamp-munim`
- Role: Viewer
- Password: Provided separately

## Final

| Assessment Area | Status | Evidence |
|---|---|---|
| Infrastructure as Code | ✅ Complete | Terraform backend, networking, security groups and EC2 |
| Configuration Management | ✅ Complete | Ansible controller, Docker deployment, ECR and idempotent playbooks |
| Monitoring & Observability | ✅ Complete | Node Exporter, Prometheus target UP and Grafana |
| Domain & Secure Access | ✅ Complete | Cloudflare DNS, Cloudflare Tunnel and private monitoring server |
| Documentation | ⏳ Finalising | README, architecture, screenshots and GitHub Pages |
