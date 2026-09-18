locals {
  name_prefix = "${var.project_name}-${var.environment}"

  subnets = {
    "k8s-cluster" = {
      address_prefixes = var.k8s_vnet_subnet
    }
  }

  address_space = var.k8s_vnet_address

  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}