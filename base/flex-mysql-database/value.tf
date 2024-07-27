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

variable "database_name" {
  description = "Database name"
  type        = string
}

variable "database_server_name" {
  description = "Database server name"
  type        = string
}