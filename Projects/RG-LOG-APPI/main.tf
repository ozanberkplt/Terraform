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
  source      = "../../modules/Modules/region_map"
  region_code = var.region_code
}

# Naming convention module
module "naming" {
  source        = "../../modules/Modules/naming_convention"
  project_name  = var.project_name
  region_code   = var.region_code
  subscription_name = var.subscription_name
}

# Resource Group deployment
module "RG-AVM" {
  source = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.2.1"
  name = module.naming.resource_group_name
  location = module.region_map.location
  tags = var.tags
}

# Log Analytics Workspace deployment
module "LOG-AVM" {
  source = "Azure/avm-res-operationalinsights-workspace/azurerm"
  version = "0.4.2"
  name = module.naming.log_analytics_name
  location = module.region_map.location
  resource_group_name = module.RG-AVM.name
  tags = var.tags
}


# App Insights deployment
module "APPI" {
  source = "Azure/avm-res-insights-component/azurerm"
  version = "0.2.0"
  name = module.naming.app_insights_name
  location = module.region_map.location
  resource_group_name = module.RG-AVM.name
  application_type = "web"
  workspace_id = module.LOG-AVM.resource_id
}