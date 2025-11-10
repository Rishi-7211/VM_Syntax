resource "azurerm_virtual_network" "Dynamic_VNet" {
  for_each            = var.virtual_networks
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes

    }

  }
}
resource "azurerm_network_security_group" "NSG" {
  for_each            = var.NSG
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dynamic "security_rule" {
    for_each = lookup(each.value, "security_rule", {})
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }

  }
}
resource "azurerm_subnet_network_security_group_association" "NSG2" {
  for_each = azurerm_network_security_group.NSG
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.NSG[each.key].id
}
