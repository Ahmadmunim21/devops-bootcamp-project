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

The repository is organised by application, infrastructure, configuration management, monitoring, and CI/CD responsibilities.

<pre>
devops-bootcamp-project/
│
├── .github/
│   └── workflows/
│       ├── app-cicd.yml          # Application CI/CD pipeline
│       └── pages.yml             # GitHub Pages deployment
│
├── ansible/
│   ├── ansible.cfg               # Ansible configuration
│   ├── inventory.ini             # Managed server inventory
│   ├── deploy-app.yml            # Web application deployment
│   ├── deploy-monitoring.yml     # Prometheus & Grafana deployment
│   ├── playbook.yml              # Base configuration playbook
│   └── requirements.yml          # Ansible dependencies
│
├── app/
│   └── Dockerfile                # Multi-stage application image
│
├── monitoring/
│   ├── docker-compose.yml        # Monitoring containers
│   ├── prometheus.yml            # Prometheus scrape configuration
│   └── grafana/
│       ├── dashboards/
│       └── provisioning/
│
├── terraform/
│   ├── backend.tf                # Remote Terraform state
│   ├── variables.tf
│   ├── outputs.tf
│   ├── ecr.tf                    # Amazon ECR
│   ├── github-actions.tf         # GitHub OIDC & CI/CD IAM
│   └── ...                       # VPC, EC2, IAM and security resources
│
└── README.md                     # Project documentation
</pre>

## Project Status

## Project Status

| Phase | Scope | Status | Key Outcome |
|---|---|---|---|
| Phase 0 | Local Environment & Repository | ✅ Complete | AWS CLI, Terraform, Git and GitHub repository configured |
| Phase 1 | Terraform Remote Backend | ✅ Complete | S3 remote state with versioning, encryption and public-access blocking |
| Phase 2 | AWS Network Infrastructure | ✅ Complete | VPC, public/private subnets, routing, Internet Gateway and NAT |
| Phase 3 | Security Groups | ✅ Complete | Public/private security groups managed through Terraform |
| Phase 4 | EC2, IAM & Systems Manager | ✅ Complete | Web, controller and monitoring EC2 instances with SSM access |
| Phase 5 | Configuration Management | ✅ Complete | Ansible controller configured and idempotency verified |
| Phase 6 | Docker & Amazon ECR | ✅ Complete | Application container built, stored in ECR and deployed to web server |
| Phase 7 | Monitoring & Observability | ✅ Complete | Node Exporter, Prometheus and Grafana operational |
| Phase 8 | Domain & Secure Access | ✅ Complete | Cloudflare DNS, HTTPS and private Grafana access through Cloudflare Tunnel |
| Phase 9 | CI/CD Automation | ✅ Complete | GitHub Actions builds, tests, pushes SHA-tagged image and deploys via Ansible |
| Phase 10 | Final | ✅ Complete | Documentation, GitHub Pages and final submission verification |

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
