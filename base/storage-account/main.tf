# This part is used to create a storage account in Azure.
resource "azurerm_storage_account" "blob_storage" {
  name                          = var.blob_storage_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = true
  access_tier                   = "Hot"

  tags = {
    environment = var.env_name
  }

  blob_properties {
    delete_retention_policy {
      days = 7 # Disable soft delete for blobs
    }
    container_delete_retention_policy {
      days = 7 # Disable soft delete for containers
    }
  }

  share_properties {
    retention_policy {
      days = 7 # Disable soft delete for file shares
    }
  }
}

# This part is used to create a container in the storage account.
resource "azurerm_storage_container" "blob_container" {
  name                  = var.blob_storage_name
  storage_account_name  = azurerm_storage_account.blob_storage.name
  container_access_type = "blob" # Changed to "blob" for anonymous read access
}