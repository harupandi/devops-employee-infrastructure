# Using azapi since AKS API Gateway currently isn't available in azurerm
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }

    azapi = {
      source = "Azure/azapi"
    }
  }
}