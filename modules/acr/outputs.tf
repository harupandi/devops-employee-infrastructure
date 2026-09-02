output "id" {
  description = "The resource ID of the Azure Container Registry."
  value       = azurerm_container_registry.this.id
}


output "acr_login_server" {
  value = azurerm_container_registry.this.login_server
}

output "acr_name" {
  value = azurerm_container_registry.this.name
}