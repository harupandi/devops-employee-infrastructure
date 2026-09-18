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

module "acr-push" {

  for_each = local.acr_push_identities

  source = "../../modules/rbac/acr-push"

  display_name         = "${var.project_name}-gh-oidc-${each.key}-acr"
  github_owner         = var.github_owner
  github_owner_id      = var.github_owner_id
  github_repository    = each.value.github_repository
  github_repository_id = each.value.github_repository_id
  environment          = each.value.environment
  acr_id               = module.acr.id

}