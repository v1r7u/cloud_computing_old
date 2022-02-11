terraform {
  required_version = "1.1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.95.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

module "storage_account" {
  source = "../modules/storage_account"

  prefix   = var.prefix
  location = var.location
  min_tls_version = "TLS1_1"
}
