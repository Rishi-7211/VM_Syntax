variable "Sqlserver" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    version                       = optional(string, "12.0")
    administrator_login           = string
    administrator_login_password  = string
    minimum_tls_version           = optional(string, "1.2")
    azuread_administrator = optional(object({
      login_username = string
      object_id      = string
    }))
  }))
}
