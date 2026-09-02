variable "display_name" {
  description = "Display name of the Microsoft Entra application."
  type        = string
}

variable "github_owner" {
  description = "GitHub repository owner (user or organization)."
  type        = string
}

variable "github_owner_id" {
  description = "Immutable GitHub owner ID."
  type        = string
}

variable "github_repository" {
  description = "GitHub repository name."
  type        = string
}

variable "github_repository_id" {
  description = "Immutable GitHub repository ID."
  type        = string
}

variable "environment" {
  description = "GitHub Environment trusted by this federated identity."
  type        = string
}

variable "acr_id" {
  description = "Resource ID of the Azure Container Registry that this identity can push to."
  type        = string
}