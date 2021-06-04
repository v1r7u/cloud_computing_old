output "azure_web_jobs_storage" { value = module.faas_eh_sa.azure_web_jobs_storage }

output "event_hub_name" { value = module.faas_eh_sa.event_hub_name }

output "event_hub_connection_string" { value = module.faas_eh_sa.event_hub_connection_string }

output "storage_account_connection_string" { value = module.faas_eh_sa.storage_account_connection_string }

output "storage_account_containername" { value = module.faas_eh_sa.storage_account_containername }

output "azure_function_name" { value = module.faas_eh_sa.azure_function_name }
