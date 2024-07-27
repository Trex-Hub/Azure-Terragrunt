variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location"
}

variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "blob_storage_name" {
  description = "Blob storage account name"
  type        = string
}

variable "blob_container_name" {
  description = "Blob container name"
  type        = string

}