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