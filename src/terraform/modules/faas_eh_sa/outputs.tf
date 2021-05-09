output "azure_web_jobs_storage" { value = azurerm_storage_account.faas_storage.primary_connection_string }

output "event_hub_name" { value = azurerm_eventhub.eh_raw.name }

output "event_hub_connection_string" { value = azurerm_eventhub_namespace.ehn.default_primary_connection_string }

output "storage_account_connection_string" { value = azurerm_storage_account.sa.primary_connection_string }

output "storage_account_containername" { value = azurerm_storage_container.events.name }

output "azure_function_name" { value = azurerm_function_app.faas.name }
