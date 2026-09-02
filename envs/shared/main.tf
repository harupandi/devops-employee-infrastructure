resource "azurerm_resource_group" "this" {
  name     = "${var.project_name}-s-rg"
  location = var.location
}

module "acr" {
  source = "../../modules/acr"

  container_registry_name = var.container_registry_name
  resource_group_name     = azurerm_resource_group.this.name
  location                = var.location

  tags = local.tags

}