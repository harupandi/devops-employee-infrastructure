# Using azapi since AKS API Gateway currently isn't available in azurerm
terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
    }
  }
}