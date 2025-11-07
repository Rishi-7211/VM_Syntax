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