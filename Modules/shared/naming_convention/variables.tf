variable "project_name" {
  description = "Short name of the project"
  type        = string
}

variable "region_code" {
  description = "Short region code (e.g., swn, usc)"
  type        = string
}

variable "resource_name" {
  description = "Name of the resource for private endpoint naming"
  type        = string
  default     = ""
}

variable "subscription_name" {
  description = "Subscription name where resources will be deployed"
  type        = string
}
