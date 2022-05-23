# Reference   : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set
# Description : Manages a Linux Virtual Machine Scale Set.
resource "azurerm_linux_virtual_machine_scale_set" "api-vmss" {
  name                = "${local.group_name}-api-vmss"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard_DS1_v2"
  instances           = 2
  admin_username      = local.azure_username

  admin_ssh_key {
    username   = local.azure_username
    public_key = local.azure_public_key
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  upgrade_mode = "Automatic"

  network_interface {
    name                      = "api-vmss-nic"
    primary                   = true
    network_security_group_id = azurerm_network_security_group.api-vmss-nsg.id
    ip_configuration {
      name                                         = "internal"
      primary                                      = true
      subnet_id                                    = azurerm_subnet.apisubnet.id
      # application_gateway_backend_address_pool_ids = [azurerm_application_gateway.ag-instance.backend_address_pool[0].id]

    }
  }

  custom_data = filebase64("${path.module}/api_install.sh")
}




