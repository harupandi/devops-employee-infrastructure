# DevOps Employee — Infrastructure

Terraform configuration for the Azure infrastructure running the DevOps Employee application.

## Infrastructure

### Shared

The `shared` environment contains resources shared across environments:

* Azure Container Registry (ACR)
* GitHub OIDC / Workload Identity Federation
* Separate `AcrPush` identities for the frontend and backend repositories

*This shared environment will soon be moved to its own repository to reduce blast radius*

### Environments

GitOps-style, same source code on `main` branch, different configuration values accessed through GitHub's Environments and `envs/*.hcl`.

Each environment (dev/qa/prod) contains its own:

* Remote state in Azure Storage
* Azure Kubernetes Service (AKS) cluster
* Virtual Network and subnets
* User Assigned Managed Identity (UAMI) for AKS networking
* ACR pull permissions for the AKS kubelet identity
* ArgoCD instance running inside the cluster

## Terraform CI/CD

Terraform changes go through GitHub Actions.

**Pull Requests**

* Run `terraform plan`
* Post the plan as a PR comment
* Give reviewers visibility into the infrastructure changes before merging

**Merge to `main`**

* Runs `terraform apply` automatically on the `dev` environment
* Applies the reviewed Terraform configuration to Azure
* Once tests and security scans complete, deployment to `qa` can be manually triggered, requiring commit ID
* Same process for prod - once `qa` completes deployment and passes tests successfully, promotion workflow to `prod` is run with gated approval

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
* [x] Dev environment
* [x] AKS networking identity
* [x] QA environment
* [x] Production environment
* [x] Environment promotion workflow
* [ ] Migrate `shared` to its own repository
* [ ] Add observability

The goal is to keep infrastructure version-controlled, reviewed through pull requests, and deployed consistently across environments.
