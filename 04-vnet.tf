# Reference   : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
# Description : Manages a virtual network including any configured subnets. 
#             : Each subnet can optionally be configured with a security group to be associated with the subnet.
resource "azurerm_virtual_network" "vnet" {
  name                = "${local.group_name}-${var.vnet_name}"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
}
