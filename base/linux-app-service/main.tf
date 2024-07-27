provider "azurerm" {
  features {}
}

resource "azurerm_linux_web_app" "linux_webapp_name" {
  name                = var.linux_webapp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  # service_plan_id     = azurerm_service_plan.app_service_plan.id
  https_only          = true
  # Default is true 
  public_network_access_enabled = true

  site_config {
    application_stack {
      docker_registry_url = "https://mcr.microsoft.com"
      docker_image_name   = "appsvc/staticsite:latest"
    }
    minimum_tls_version = "1.2"
    ftps_state          = "FtpsOnly"
    always_on           = false
  }

  logs {
    detailed_error_messages = true
    failed_request_tracing  = true

    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb   = 100
      }
    }
  }

  tags = var.tags

  # app_settings work as the environment variables for the web app
  # Add Key Vault references for sensitive data if using managed identity:
  # "SENSITIVE_SETTING" = "@Microsoft.KeyVault(SecretUri=https://myvault.vault.azure.net/secrets/mysecret/)"
  # app_settings = {
  #   "DOCKER_REGISTRY_SERVER_URL"          = "https://mcr.microsoft.com"
  #   "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  # }

  app_settings = merge(
    var.app_settings,
    {
      "DOCKER_REGISTRY_SERVER_URL"          = "https://mcr.microsoft.com"
      "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    }
  )

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "storage_blob_contributor" {
  scope                = var.blob_storage_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_linux_web_app.linux_webapp_name.identity[0].principal_id
}