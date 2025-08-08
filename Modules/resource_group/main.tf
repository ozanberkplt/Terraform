terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  
}

resource "azurerm_resource_group" "RG" {
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags
}
