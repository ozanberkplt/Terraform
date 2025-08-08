
# Terraform Infrastructure Modules

This repository is a work-in-progress collection of Terraform configurations and modules, aimed at automating Azure resource provisioning while sharpening Terraform expertise.

---

## 📁 Repository Structure

### 🧱 Modules/

Reusable Terraform modules for common Azure infrastructure components:

- **log-analytics-workspace/**  
  Defines a Log Analytics Workspace resource with configurable parameters.

- **resource-group/**  
  Standardized Azure Resource Group module.

- **shared/**  
  Shared variables, locals, providers, or utility code used across modules/projects.

---

### 🚧 Projects/

Sample implementations and composite deployments using the modules:

- **RG-LOG/**  
  Deploys a resource group along with a Log Analytics Workspace.

- **RG-LOG-APPI/**  
  Builds on `RG-LOG` to include Application Insights or other observability components.

- **RG-SA-KV/**  
  Deploys a resource group with a Storage Account and Key Vault.

Each project serves as a practical example of how to consume modules in real-world deployments.

---

## 🚀 Usage

Initialize the working directory and apply a specific project:

```bash
cd Projects/RG-LOG
terraform init
terraform plan
terraform apply
```

Customize variables by editing `terraform.tfvars` or passing them via `-var` flags.

---

## 📦 Requirements

- Terraform CLI (v1.5+ recommended)
- Azure CLI logged in: `az login`
- Backend setup if using remote state (optional but recommended)

---

## 🛠️ In Progress

This repo is actively evolving. Modules and project structures may change as skills and standards improve. Feedback and refactoring are expected.

---


## ✍️ Author

Maintained by [ozanberkpolat](https://github.com/ozanberkpolat)

