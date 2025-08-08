variable "region_code" {
  description = "Region code based on naming convention (e.g., swn, usc)"
  type        = string
  validation {
    condition     = contains(keys(local.region_map), var.region_code)
    error_message = "Invalid region_code. Must be one of: swn, usc, weu, sea."
  }
}

locals {
  region_map = {
    swn = "switzerlandnorth"
    usc = "uksouth"
    weu = "westeurope"
    sea = "southeastasia"
  }

  location = local.region_map[var.region_code]
}

output "location" {
  value = local.location
}
