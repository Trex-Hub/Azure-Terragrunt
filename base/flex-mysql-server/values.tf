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

variable "administrator_login" {
  description = "The administrator login for the MySQL Server"
}

variable "administrator_password" {
  description = "The administrator password for the MySQL Server"

}

variable "mysql_server_name" {
  description = "The name of the MySQL Server"
}