locals {
  name_prefix = "${var.project_name}-${var.environment}"

  subnets = {
    "k8s-cluster" = {
      address_prefixes = ["10.2.1.0/24"]
    }
  }

  address_space = ["10.2.0.0/16"]

  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}