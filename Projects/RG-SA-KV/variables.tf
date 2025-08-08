variable "project_name" {
  description = "Short name of the project"
  type        = string
}

variable "subscription_name" {
  description = "Subscription name where resources will be deployed"
  type        = string
  
}

variable "region_code" {
  description = "Short region code (e.g., swn, usc)"
  type        = string
}

variable "tags" {
  description = "Standard tags applied to resource group"
  type        = map(string)
  default = {
    CostCenter = ""
    Owner       = ""
  }
  
}