provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource-group" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "property guru ${var.env_name}"
  }
}
