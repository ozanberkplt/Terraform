terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Region mapping module
module "region_map" {
  source      = "../modules/region_map"
  region_code = var.region_code
}

# Naming convention module
module "naming" {
  source        = "../modules/naming_convention"
  project_name  = var.project_name
  region_code   = var.region_code
  subscription_name = var.subscription_name
}

# Resource Group deployment
module "resource_group" {
  source              = "../modules/resource_group"
  resource_group_name = module.naming.resource_group_name
  location            = module.region_map.location
  tags                = var.tags
}

# Log Analytics Workspace deployment
module "log_analytics" {
  source              = "../modules/log_analytics"
  log_analytics_name  = module.naming.log_analytics_name
  location            = module.region_map.location
  resource_group_name = module.resource_group.resource_group_name
}