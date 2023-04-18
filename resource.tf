resource "azurerm_application_insights" "app_insights" {
  name                                  = var.name
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  application_type                      = var.application_type
  daily_data_cap_in_gb                  = var.daily_data_cap_in_gb
  daily_data_cap_notifications_disabled = var.daily_data_cap_notifications_disabled
  retention_in_days                     = var.retention_in_days
  sampling_percentage                   = var.sampling_percentage
  disable_ip_masking                    = var.disable_ip_masking
  tags                                  = local.tags
  workspace_id                          = var.workspace_id
  local_authentication_disabled         = var.local_authentication_disabled
  internet_ingestion_enabled            = var.internet_ingestion_enabled
  internet_query_enabled                = var.internet_query_enabled
  force_customer_storage_for_profiler   = var.force_customer_storage_for_profiler
  lifecycle {
    ignore_changes = [
      tags["create_date"]
    ]
  }
}

resource "azurerm_role_assignment" "app_insights_contributor" {
  for_each             = var.azure_ad_groups != [] ? toset(var.azure_ad_groups) : []
  scope                = azurerm_application_insights.app_insights.id
  role_definition_name = "Application Insights Component Contributor Custom"
  principal_id         = each.value
}