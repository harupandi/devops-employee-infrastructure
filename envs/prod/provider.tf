provider "azurerm" {
  features {}

  use_oidc = true

}

provider "helm" {
  kubernetes = {
    host                   = module.aks.kube_config_host
    client_certificate     = module.aks.kube_config_client_certificate
    client_key             = module.aks.kube_config_client_key
    cluster_ca_certificate = module.aks.kube_config_cluster_ca_certificate
  }
}