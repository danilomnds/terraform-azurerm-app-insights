locals {
  default_tags = {
    deployedby  = "Terraform"
    provider    = "azr"
    region      = replace(lower(var.location), " ", "")
    create_date = formatdate("DD/MM/YY hh:mm", timeadd(timestamp(), "-3h"))
    type        = "saas"
    resource    = "serverless"
  }
  tags = merge(local.default_tags, var.tags)
}