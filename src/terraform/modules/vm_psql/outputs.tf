output "tls_private_key" { value = tls_private_key.vm_admin.private_key_pem }

output "private_vm_ip" { value = azurerm_public_ip.vm_private_pip.ip_address }

output "public_vm_ip" { value = azurerm_public_ip.vm_public_pip.ip_address }

output "private_psql_hostname" { value = azurerm_postgresql_server.private.name }

output "public_psql_hostname" { value = azurerm_postgresql_server.public.name }
