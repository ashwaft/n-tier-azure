resource "azurerm_network_security_group" "ui-vmss-nsg" {
  name                = "${local.group_name}-ui-vmss-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = local.ui_vmss_inbound_ports
    content {
      name                       = "Inbound-rule-${security_rule.key}"
      description                = "Inbound Rule ${security_rule.key}"
      priority                   = security_rule.key
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}