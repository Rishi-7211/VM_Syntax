resource "azurerm_mssql_server" "sql" {
  for_each = var.Sqlserver

  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = lookup(each.value, "version", "12.0")
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = lookup(each.value, "minimum_tls_version", "1.2")
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled", true)

  dynamic "azuread_administrator" {
    for_each = lookup(each.value, "azuread_administrator", null) != null ? [each.value.azuread_administrator] : []
    content {
      login_username = azuread_administrator.value.login_username
      object_id      = azuread_administrator.value.object_id
    }
  }
}


