output "acr_id" {
  description = "The resource ID of the Azure Container Registry."
  value       = module.acr.id
}

output "acr_name" {
  description = "The name of the Azure Container Registry."
  value       = module.acr.name
}

output "acr_login_server" {
  description = "The login server URL of the Azure Container Registry."
  value       = module.acr.login_server
}

output "github_oidc_client_ids" {
  description = "Client IDs of the GitHub OIDC identities, keyed by application."
  value = {
    for key, identity in module.acr-push :
    key => identity.client_id
  }
}