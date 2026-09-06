data "terraform_remote_state" "shared" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateharupandi"
    container_name       = "tfstate"
    key                  = "shared.tfstate"

    use_azuread_auth = true
  }
}

resource "azurerm_resource_group" "this" {
  name     = "${local.name_prefix}-rg"
  location = var.location

  tags = local.tags
}

module "network" {
  source              = "../../modules/network"
  name                = "${local.name_prefix}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = local.address_space
  subnets             = local.subnets
  tags                = local.tags
}

module "aks" {
  source = "../../modules/aks"

  cluster_name        = "${local.name_prefix}-aks"
  uami_name           = "${local.name_prefix}-aks-identity"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  subnet_id           = module.network.subnet_ids["k8s-cluster"]
  pod_cidr            = var.pod_cidr
  service_cidr        = var.service_cidr
  dns_service_ip      = var.dns_service_ip
  sku_tier            = "Standard"
  kubernetes_version  = var.kubernetes_version
  tags                = local.tags
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = data.terraform_remote_state.shared.outputs.acr_id
  role_definition_name = "AcrPull"
  principal_id         = module.aks.kubelet_identity
}

module "argocd" {
  source = "../../modules/argocd"

  environment = var.environment

  providers = {
    helm       = helm
    kubernetes = kubernetes
  }

  depends_on = [
    module.aks
  ]
}