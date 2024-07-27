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

variable "app_service_name_plan" {
  type        = string
  description = "App Service Plan"
}

variable "created_by" {
  type        = string
  description = "Created by"
  default     = "DevOps Team"
}