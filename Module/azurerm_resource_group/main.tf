resource "azurerm_resource_group" "Dynamic_RG" {
  for_each   = var.resource_groups
  name       = each.value.name
  location   = each.value.location
  tags       = each.value.tags
  managed_by = each.value.managed_by
  timeouts {
    create = "90m"
    update = "5m"
    delete = "90m"
    read   = "5m"
  }
}

