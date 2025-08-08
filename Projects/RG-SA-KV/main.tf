terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

data "azurerm_client_config" "current" {}

# Region mapping module
module "region_map" {
  source      = "../../modules/Modules/region_map"
  region_code = var.region_code
}

# Naming convention module
module "naming_convention" {
  source        = "../../modules/Modules/naming_convention"
  project_name  = var.project_name
  region_code   = var.region_code
  subscription_name = var.subscription_name
}

# Private DNS Zones module
module "private-dns-zone" {
  source = "../../modules/Modules/private-dns-zones"
}

# Resource Group deployment
module "RG-SA-AVM" {
  source = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.2.1"
  name = "RG-${module.naming_convention.subscription_prefix}-storage-${var.region_code}"
  location = module.region_map.location
  tags = var.tags
}

# Resource Group deployment
module "RG-KV-AVM" {
  source = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.2.1"
  name = "RG-${module.naming_convention.subscription_prefix}-kv-${var.region_code}"
  location = module.region_map.location

}


# Storage Account deployment
module "SA" {
  source = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "0.3.0"
  name = module.naming_convention.storage_account_name
  location = module.region_map.location
  resource_group_name = module.RG-SA-AVM.name
  account_tier = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  is_hns_enabled = true
  public_network_access_enabled = false
  access_tier = "Hot"
  min_tls_version = "TLS1_2"
  shared_access_key_enabled = false
}

# Key Vault deployment
module "KV" {
  source = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.3.0"
  name = module.naming_convention.key_vault_name
  location = module.region_map.location
  resource_group_name = module.RG-KV-AVM.name
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"
  purge_protection_enabled = false
  public_network_access_enabled = false
}