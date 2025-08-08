
variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
  default     = ""  # Optional: leave empty to use default subscription from auth context
}

provider "azurerm" {
  features {}

  # Only set subscription_id if the variable is not empty
  subscription_id = var.subscription_id != "" ? var.subscription_id : null
}
