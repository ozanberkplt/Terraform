# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_log_analytics_workspace" "LOG" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name
  retention_in_days   = 30
  sku                 = "PerGB2018"
}
