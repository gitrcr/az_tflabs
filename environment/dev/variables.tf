variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "vnet_name" { type = string }
variable "address_space" { type = list(string) }
variable "admin_ip" { type = string }
variable "admin_username" { type = string }
variable "public_key" { type = string }

variable "subscription_id" {
  description = "The subscription ID for the lab environment."
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID for the lab environment."
  type        = string
}

variable "client_id" {
  description = "The client ID for the lab environment."
  type        = string
}

variable "client_secret" {
  description = "The client secret for the lab environment."
  type        = string
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "Dev"
    Project     = "AzTfLanding"
    ManagedBy   = "Terraform"
    Purpose     = "FastLab"
  }
}