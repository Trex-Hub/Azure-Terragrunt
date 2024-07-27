# Output the storage account ID for use in role assignments
output "storage_account_id" {
  value = azurerm_storage_account.blob_storage.id
}