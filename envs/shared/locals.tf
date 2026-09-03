locals {

  acr_push_identities = {
    frontend = {
      github_repository   = "${var.project_name}-frontend"
      github_repository_id = "1345392898"
      environment          = var.environment
    }

    backend = {
      github_repository   = "${var.project_name}-backend"
      github_repository_id = "1345395196"
      environment          = var.environment
    }
  }

  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}