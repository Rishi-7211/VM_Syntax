
resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}

resource "azurerm_network_security_group" "NSG" {
  for_each = var.NSG
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = each.value.security_rule
    content {
    name                       = security_rule.value.name
    priority                   = security_rule.value.priority
    direction                  = security_rule.value.direction
    access                     = security_rule.value.access
    protocol                   = security_rule.value.protocol
    source_port_range          = security_rule.value.source_port_range
    destination_port_range     = security_rule.value.destination_port_range
    source_address_prefix      = security_rule.value.source_address_prefix
    destination_address_prefix = security.rule.value.destination_address_prefix
    }
   
  }
}
resource "azurerm_subnet_network_security_group_association" "NSG" {
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.NSG.id
}