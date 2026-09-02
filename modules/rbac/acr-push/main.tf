resource "azuread_application" "this" {
  display_name = var.display_name
}

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

resource "azuread_application_federated_identity_credential" "github" {
  application_id = azuread_application.this.id

  display_name = "github-${var.environment}"

  issuer = "https://token.actions.githubusercontent.com"

  subject = "repo:${var.github_owner}@${var.github_owner_id}/${var.github_repository}@${var.github_repository_id}:environment:${var.environment}"

  audiences = [
    "api://AzureADTokenExchange"
  ]
}

resource "azurerm_role_assignment" "this" {
  scope                = var.acr_id
  role_definition_name = "AcrPush"
  principal_id         = azuread_service_principal.this.object_id
}