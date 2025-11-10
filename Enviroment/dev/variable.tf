variable "resource_groups" {
  description = "A map of resource groups to create"
  type = map(object({
    name       = string
    location   = string
    tags       = optional(map(string))
    managed_by = optional(string)
  }))
}
variable "virtual_networks" {
  description = "A map of virtual networks to create"
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))
}
variable "public_ips" {
  description = "A map of public IP configurations."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
    tags                = optional(map(string))
  }))
}

variable "key_vaults" {
  description = "A map of Key Vaults to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
    tenant_id           = string
    tags                = optional(map(string))
  }))
}

variable "storage_accounts" {
  description = "A map of storage accounts to create"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = optional(map(string))
  }))
}
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
    name        = string
    location    = string
    rg_name     = string
    vnet_name   = string
    subnet_name = string

    security_rule = optional(map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })))
  }))
}
