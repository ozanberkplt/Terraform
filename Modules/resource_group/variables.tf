variable "location" {
  description = "Azure region where the resource group will be created"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
}
