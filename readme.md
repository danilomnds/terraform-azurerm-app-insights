# Module - Azure Application Insights
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the Application Insights Creation.

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.4.5            | 3.50.0          |

## Specifying a version

To avoid that your code get updates automatically, is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can define the version of the module.

Note: The `?ref=***` refers a tag on the git module repo.

## Use case

```hcl
module "<app-insights-name>" {
  source = "git::https://github.com/danilomnds/terraform-azurerm-app-insights?ref=v1.0.0" 
  name = "<app-insights-name>"
  location = "<your-region>"
  resource_group_name = "<resource-group>"
  application_type = "<your application type>"
  daily_data_cap_in_gb = <1>
  sampling_percentage = <30>
  azure_ad_groups = ["group id 1","group id 2"]
  tags = {
    key1 = "value1"
    key2 = "value2"    
  }  
}
output "app_insights_name" {
  value = module.<app-insights-name>.name
}
output "app_insights_id" {
  value = module.<app-insights-name>.id
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | app insights name | `string` | n/a | `Yes` |
| location | azure region | `string` | n/a | `Yes` |
| resource_group_name | resource group name where the app insights will be created | `string` | n/a | `Yes` |
| application_type | specifies the type of application insights to create | `string` | n/a | `Yes` |
| daily_data_cap_in_gb | specifies the application insights component daily data volume cap in gb | `number` | `1` | No |
| daily_data_cap_notifications_disabled | specifies if a notification email will be send when the daily data volume cap is met | `bool` | `false` | No |
| retention_in_days | specifies the retention period in days | `number` | `90` | No |
| sampling_percentage | specifies the percentage of the data produced by the monitored application that is sampled for application insights telemetry | `number` | `50` | No |
| disable_ip_masking | by default the real client ip is masked as 0.0.0.0 in the logs | `bool` | `false` | No |
| tags | tags for the resource | `map(string)` | `{}` | No |
| workspace_id | specifies the id of a log analytics workspace resource | `string` | n/a | No |
| local_authentication_disabled | disable non-Azure AD based auth | `bool` | `false` | No |
| internet_ingestion_enabled | should the application insights component support ingestion over the public internet | `bool` | `false` | No |
| internet_query_enabled | should the application insights component support querying over the public internet | `bool` | `true` | No |
| force_customer_storage_for_profiler | should the application insights component force users to create their own storage account for profiling  | `bool` | `false` | No |
| azure_ad_groups | list of azure AD groups that will be granted the Application Insights Component Contributor role  | `list` | `[]` | No |

## Output variables

| Name | Description |
|------|-------------|
| name | application insights name |
| id | application insights id |

## Documentation

Terraform Azure Application Insights: <br>
[https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights)<br>