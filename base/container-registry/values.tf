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

variable "acr_name" {
  description = "Azure Container Registry name"
}