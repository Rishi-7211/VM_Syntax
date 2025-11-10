variable "vms" {
  type = map(object(
    {
      nic_name               = string
      location               = string
      rg_name                = string
      vnet_name              = string
      subnet_name            = string
      pip_name               = string
      vm_name                = string
      size                   = string
      admin_username         = string
      admin_password         = string
      source_image_reference = map(string)
    }
  ))
}
variable "NSG" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    security_rule = optional(map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                      = string
      protocol                   = string
      source_port_range           = string
      destination_port_range      = string
      source_address_prefix       = string
      destination_address_prefix  = string
    })))
  }))
}

