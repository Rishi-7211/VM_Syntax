resource "azurerm_kubernetes_cluster" "AKS" {
    for_each = var.AKS
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix = "${each.value.name}-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DC2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

