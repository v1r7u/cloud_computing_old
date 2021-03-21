terraform {
  required_version = "0.14.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.52.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

module "vm_psql_net" {
  source = "./vm_psql"

  prefix   = var.prefix
  location = var.location

  psql_admin        = var.psql_admin
  psql_password     = var.psql_password
  psql_storage_size = var.psql_storage_size
  psql_sku          = var.psql_sku

  vm_size           = var.vm_size
  ssh_pub_key_path  = var.ssh_pub_key_path
}
