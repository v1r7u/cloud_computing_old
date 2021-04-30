resource "azurerm_linux_virtual_machine" "public" {
  name                            = "${var.prefix}-public-vm"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  size                            = var.vm_size
  admin_username                  = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm_public.id
  ]

  admin_ssh_key {
    username = "adminuser"
    public_key = file(var.ssh_pub_key_path)
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

resource "azurerm_network_interface" "vm_public" {
  name                = "${var.prefix}-vm-public-nic"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.vms_public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "vm_public_sg" {
  network_interface_id      = azurerm_network_interface.vm_public.id
  network_security_group_id = azurerm_network_security_group.main.id
}
