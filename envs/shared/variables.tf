variable "project_name" {
  type = string
}

variable "container_registry_name" {
  type = string
}

variable "location" {
  type = string
}

variable "github_owner" {
  description = "GitHub repository owner (user or organization)."
  type        = string
}

variable "github_owner_id" {
  description = "Immutable GitHub owner ID."
  type        = string
}

variable "environment" {
  description = "GitHub Environment trusted by the federated identity."
  type        = string
}