variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location for the App Service"
}

variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "linux_webapp_name" {
  description = "Name of the Linux Web App"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}

variable "app_settings" {
  description = "App settings for the Linux Web App"
  type        = map(string)
  default = {}
}

variable "service_plan_id" {
  description = "ID of the App Service Plan"
  type        = string
}

variable "blob_storage_id" {
  description = "ID of the Blob Storage Account"
  type        = string
}