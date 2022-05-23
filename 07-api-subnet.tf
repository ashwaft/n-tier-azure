# Reference   : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
# Description : Manages a subnet. Subnets represent network segments within the IP space defined by the virtual network.
# resource "azurerm_subnet" "apisubnet" {
#   name                 = "${azurerm_virtual_network.vnet.name}-${var.apisubnet_name}"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = var.apisubnet_address
# }
