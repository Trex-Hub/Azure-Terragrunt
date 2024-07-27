provider "azurerm" {
  features {}
}

resource "azurerm_mysql_flexible_database" "mysql_database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = var.database_server_name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

  # Uncomment the lifecycle block below to prevent the database from being destroyed
  
  # lifecycle {
  #   prevent_destroy = true
  # }

  
}