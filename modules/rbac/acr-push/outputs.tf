output "client_id" {
  description = "Client ID of the Microsoft Entra application."
  value       = azuread_application.this.client_id
}

output "object_id" {
  description = "Object ID of the Microsoft Entra service principal."
  value       = azuread_service_principal.this.object_id
}

output "application_id" {
  description = "Object ID of the Microsoft Entra application."
  value       = azuread_application.this.id
}