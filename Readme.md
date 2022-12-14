# 🌐 MongoDB deployment using Terraform

## 📚 Description

This project contains examples and instructions for:

1. [Terraform](https://www.terraform.io) general usage
2. Creating [MongoDB Atlas cluster](https://www.mongodb.com/docs/atlas/getting-started/) using Terraform

## 🛠️ Prerequisites

- Install the [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- Prerequisites for **example 1**:
  - [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running locally
- Prerequisites for **example 2**:
  - A [MongoDB Atlas Account (Free)](https://cloud.mongodb.com/) with access to manage your desired organization
  - A payment method is required for your organization, as the MongoDB Terraform Provider can't be used for creating M0 instances (free database instances). You can either check [MongoDB Billing information](https://www.mongodb.com/docs/atlas/billing/#view-and-edit-your-billing-profile) for setting up a payment method or integrate payment with your AWS account through [AWS Self-Serve Marketplace](https://www.mongodb.com/docs/atlas/billing/aws-self-serve-marketplace/)

---

## 🐳 Example 1: Using Terraform for docker management

- Access the project folder:
  ```bash
  cd docker-container-example
  ```
- Create a new [Terraform Workspace](https://developer.hashicorp.com/terraform/language/state/workspaces), by running the command:
  ```bash
  terraform workspace new local
  ```
- Prepare your working directory for other commands (install provider plugins):
  ```bash
  terraform init
  ```
- Optionally, show changes required by the current configuration:
  ```bash
  terraform plan
  ```
- Create or update infrastructure:
  ```bash
  terraform apply
  ```
- List Docker containers:
  ```bash
  docker ps
  ```
- Access on the browser: [http://localhost:8000/](http://localhost:8000/)
- Optionally, update _terraform.tfvars_ file, and apply the new changes:
  ```bash
  terraform apply
  ```
- Show the current state:
  ```bash
  terraform show
  ```
- Destroy previously-created infrastructure:
  ```bash
  terraform destroy
  ```
- Show the current state (should be empty now):
  ```bash
  terraform show
  ```

---

### 📝 Docs and external resources:

- [Docker Provider](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)
- [MongoDB Atlas Provider](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs)
