# DevOps Employee — Infrastructure

Terraform configuration for the Azure infrastructure running the DevOps Employee application.

## Infrastructure

### Shared

The `envs/shared` environment contains resources shared across environments:

* Azure Container Registry (ACR)
* GitHub OIDC / Workload Identity Federation
* Separate `AcrPush` identities for the frontend and backend repositories

### Dev

The `envs/dev` environment currently contains:

* Azure Kubernetes Service (AKS)
* Virtual Network and subnets
* User Assigned Managed Identity (UAMI) for AKS networking
* ACR pull permissions for the AKS kubelet identity

Staging and Production environments will be added as the project grows.

## Terraform CI/CD

Terraform changes go through GitHub Actions.

**Pull Requests**

* Run `terraform plan`
* Post the plan as a PR comment
* Give reviewers visibility into the infrastructure changes before merging

**Merge to `main`**

* Runs `terraform apply`
* Applies the reviewed Terraform configuration to Azure

GitHub Actions authenticates to Azure using **OIDC** rather than stored credentials. Separate identities are used for Terraform `plan` and `apply`, scoped through GitHub Environments.

```text
PR → Terraform Plan → PR Comment → Review → Merge
                                               │
                                               ▼
                                      Terraform Apply
```

## Roadmap

* [x] Shared ACR
* [x] GitHub OIDC / WIF
* [x] Dev AKS infrastructure
* [x] AKS networking identity
* [ ] Staging environment
* [ ] Production environment
* [ ] Environment promotion workflow

The goal is to keep infrastructure version-controlled, reviewed through pull requests, and deployed consistently across environments.
