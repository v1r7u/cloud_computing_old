resource "azurerm_resource_group" "sa" {
  name     = "${var.prefix}-sa-rg"
  location = var.location
}

resource "azurerm_log_analytics_workspace" "sample_sa" {
  name                = "${var.prefix}-sa"
  location            = azurerm_resource_group.sa.location
  resource_group_name = azurerm_resource_group.sa.name

  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
}