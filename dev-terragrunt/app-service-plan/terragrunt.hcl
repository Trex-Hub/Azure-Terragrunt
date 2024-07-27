include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../base//app-service-plan"
}

locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

inputs = {
  resource_group_name = local.common_vars.resource_group_name
  location            = local.common_vars.location
  env_name            = local.common_vars.env_name
  app_service_name_plan = "prodpropertyguru"
  created_by          = "devendra@mavonic"
}