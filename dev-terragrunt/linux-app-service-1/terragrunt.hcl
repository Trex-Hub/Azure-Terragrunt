include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../base//linux-app-service"
}

locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

inputs = {
  resource_group_name = local.common_vars.resource_group_name
  location            = local.common_vars.location
  env_name            = local.common_vars.env_name
  service_plan_id     = "/subscriptions/6ebb80a6-8c80-4982-9680-4b72982bcabd/resourceGroups/prod-propertyguru/providers/Microsoft.Web/serverFarms/asp-prodpropertyguru-prod"
  blob_storage_id     = "/subscriptions/6ebb80a6-8c80-4982-9680-4b72982bcabd/resourceGroups/property-guru/providers/Microsoft.Storage/storageAccounts/propertygurublob"
  linux_webapp_name   = "prod-propertyguru-backend"
    tags                = { owner = "devendra", env = local.common_vars.env_name }

}