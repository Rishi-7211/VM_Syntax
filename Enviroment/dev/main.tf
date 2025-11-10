module "resource_group" {
  source          = "../../Module/azurerm_resource_group"
  resource_groups = var.resource_groups
}
module "storage_account" {
  source           = "../../Module/azurerm_storage_account"
  storage_accounts = var.storage_accounts
  depends_on       = [module.resource_group]
}
module "virtual_network" {
  source           = "../../Module/azurerm_networking"
  virtual_networks = var.virtual_networks
  depends_on       = [module.resource_group]
}
module "public_ip" {
  source     = "../../Module/azurerm_public_ip"
  public_ips = var.public_ips
  depends_on = [module.resource_group]
}
module "key_vault" {
  source     = "../../Module/azurerm_key_vault"
  key_vaults = var.key_vaults
  depends_on = [module.resource_group]
}
module "azurerm_compute" {
  source  = "../../Module/azurerm_compute"
  vms     = var.vms
  depends_on = [
    module.resource_group,
    module.virtual_network,
    module.public_ip,
    module.key_vault
  ]
}
module "NSG_association"{
  source = "../../Module/azurerm_Nsg_Association"
  NSG = var.NSG
  depends_on = [ module.resource_group, module.virtual_network ]
}
