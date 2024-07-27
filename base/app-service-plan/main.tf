provider "azurerm" {
  features {}
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "asp-${var.app_service_name_plan}-${var.env_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B3"

  tags = {
    "env"        = var.env_name
    "managed-by" = "terraform"
    "created-by" = var.created_by
  }
}