output "acr_id" {
  description = "The resource ID of the ACR."
  value       = module.acr.id
}

output "acr_name" {
  description = "The name of the ACR."
  value       = module.acr.name
}

output "acr_login_server" {
  description = "The ACR login server."
  value       = module.acr.login_server
}