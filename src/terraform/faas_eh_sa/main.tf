resource "azurerm_resource_group" "faas_eh_sa" {
  name     = "${var.prefix}-faas-eh-sa-rg"
  location = var.location
}

resource "random_string" "faas_salt" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                = "${var.prefix}${random_string.faas_salt.result}sa"
  location            = azurerm_resource_group.faas_eh_sa.location
  resource_group_name = azurerm_resource_group.faas_eh_sa.name

  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
}
