provider "azurerm" {
  features {}
}

resource "azurerm_mysql_flexible_server" "mysql_flex_server" {
  name                   = var.mysql_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  backup_retention_days  = 7
  sku_name               = "Burstable_B1ms"
  # Burstable_B1ms
  # 1 vCores, 2 GiB RAM 640 IOPS & Auto scale IOPS
  version = "8.0.21"
  storage {
    size_gb = 64
  }
  public_network_access_enabled = false
  tags                          = { env = var.env_name }
}


#  ssl_enforcement_enabled          = true
# ssl_minimal_tls_version_enforced = "TLS1_2"