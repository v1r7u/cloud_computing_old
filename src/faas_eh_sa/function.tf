resource "azurerm_storage_account" "faas_storage" {
  name                     = "${var.prefix}${random_string.faas_salt.result}funcsa"
  resource_group_name      = azurerm_resource_group.faas_eh_sa.name
  location                 = azurerm_resource_group.faas_eh_sa.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "faas" {
  name                = "${var.prefix}-${random_string.faas_salt.result}-service-plan"
  location            = azurerm_resource_group.faas_eh_sa.location
  resource_group_name = azurerm_resource_group.faas_eh_sa.name
  kind                = "functionapp"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "faas" {
  name                       = "${var.prefix}-${random_string.faas_salt.result}-func"
  location                   = azurerm_resource_group.faas_eh_sa.location
  resource_group_name        = azurerm_resource_group.faas_eh_sa.name
  app_service_plan_id        = azurerm_app_service_plan.faas.id
  storage_account_name       = azurerm_storage_account.faas_storage.name
  storage_account_access_key = azurerm_storage_account.faas_storage.primary_access_key
  os_type                    = "linux"
  version                    = "~3"

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
  }
}
