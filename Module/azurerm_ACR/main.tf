resource "azurerm_container_registry" "acr" {
  for_each = var.ACR

  name                = lower(each.value.name)     # ensure lowercase
  resource_group_name = each.value.rg_name
  location            = each.value.location
  sku                 = "Premium"
  admin_enabled       = false

  # optional: organization-wide tagging
  tags = merge(
    {
      Environment = each.value.environment
      ManagedBy   = "Terraform"
    },
    each.value.tags
  )

  # Geo-replication (list-based to easily expand)
  dynamic "georeplications" {
    for_each = each.value.replica_locations
    content {
      location                = georeplications.value
      zone_redundancy_enabled = true
      tags                    = {}
    }
  }
}

