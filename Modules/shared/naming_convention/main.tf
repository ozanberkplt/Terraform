locals {
  #Subscription name prefix recognition
  sub_parts   = split("-", var.subscription_name)
  environment = lower(join("", slice(local.sub_parts, 1, length(local.sub_parts))))
  subscription_prefix = local.environment
  resource_group_name = "rg-${local.environment}-${var.project_name}-${var.region_code}"

  log_analytics_name      = "log-${var.project_name}-${var.region_code}"
  key_vault_name          = "kv-${var.project_name}-${var.region_code}"
  storage_account_name    = "gun${var.project_name}${var.region_code}"
  private_endpoint_name   = "pe-${var.resource_name}-${var.region_code}"
  app_insights_name       = "appi-${var.project_name}-${var.region_code}"
}
