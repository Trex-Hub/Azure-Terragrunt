include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../base//flex-mysql-database"
}

locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

inputs = {
  resource_group_name = "property-guru"
  location            = local.common_vars.location
  env_name            = local.common_vars.env_name
  database_name       = "prod-propertyguru-mysql"
  database_server_name         = "property-guru-db"
}