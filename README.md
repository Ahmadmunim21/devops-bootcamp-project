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

### Phase 3
- [ ] Security Groups

### Phase 4
- [ ] EC2 instances

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

### Phase 6
- [ ] Docker and ECR

### Phase 7
- [ ] Prometheus and Grafana

### Phase 8
- [ ] Cloudflare and secure access

### Phase 9
- [ ] CI/CD and documentation
