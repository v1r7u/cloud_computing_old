resource "azurerm_eventhub_namespace" "ehn" {
  name                = "${var.prefix}${random_string.faas_salt.result}-eh"
  location            = azurerm_resource_group.faas_eh_sa.location
  resource_group_name = azurerm_resource_group.faas_eh_sa.name

  sku      = "Standard"
  capacity = 1

  auto_inflate_enabled     = true
  maximum_throughput_units = 5

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_eventhub" "eh_raw" {
  name                = "iot_events_raw"
  namespace_name      = azurerm_eventhub_namespace.ehn.name
  resource_group_name = azurerm_resource_group.faas_eh_sa.name

  partition_count   = 3
  message_retention = 1
}
