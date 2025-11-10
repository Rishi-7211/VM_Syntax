variable "virtual_networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))
}
variable "NSG" {
  type = map(object({
    name                = string
    location            = string
    rg_name             = string
    vnet_name           = string
    subnet_name         = string

    security_rule = optional(map(object({
      name                       = string
      priority                   = number
      direction                   = string
      access                      = string
      protocol                    = string
      source_port_range           = string
      destination_port_range      = string
      source_address_prefix       = string
      destination_address_prefix  = string
    })))
  }))
}