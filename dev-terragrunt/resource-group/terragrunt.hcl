include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../base//resource-group"
}

locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

inputs = {
  resource_group_name = local.common_vars.resource_group_name
  location            = local.common_vars.location
  env_name            = local.common_vars.env_name
}