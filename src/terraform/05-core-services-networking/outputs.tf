output "tls_private_key" { value = module.vm_psql_net.tls_private_key }

output "private_vm_ip" { value = module.vm_psql_net.private_vm_ip }

output "public_vm_ip" { value = module.vm_psql_net.public_vm_ip }

output "private_psql_hostname" { value = module.vm_psql_net.private_psql_hostname }

output "public_psql_hostname" { value = module.vm_psql_net.public_psql_hostname }

output "psql_admin_name" { value = var.psql_admin }
