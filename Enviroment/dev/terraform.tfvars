resource_groups = {
  rg1 = {
    name     = "dev-rg-1"
    location = "Central India"
    tags = {
      environment = "dev"
      project     = "projectA"
    }
    managed_by = "teamA"
  }

}
virtual_networks = {
  vnet1 = {
    name                = "dev-vnet-1"
    address_space       = ["10.0.0.0/16"]
    location            = "Central India"
    resource_group_name = "dev-rg-1"
    tags = {
      environment = "dev"
      project     = "projectA"
    }
    subnets = [
      {
        name             = "frontendsubnet_dev"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backendsubnet_dev"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ips = {
  pip1 = {
    name                = "frontend-pip-dev"
    location            = "Central India"
    resource_group_name = "dev-rg-1"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
      project     = "projectA"
    }
  }
  pip2 = {
    name                = "backend-pip-dev"
    location            = "Central India"
    resource_group_name = "dev-rg-1"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
      project     = "projectA"
    }
  }
}
key_vaults = {
  kv1 = {
    name                = "keyvault-dev-72112"
    location            = "Central India"
    resource_group_name = "dev-rg-1"
    sku_name            = "standard"
    tenant_id           = "e2812fdf-98fe-4c59-b46d-db67506f1035"
    tags = {
      environment = "dev"
      project     = "projectA"
    }
  }
}
storage_accounts = {
  sa1 = {
    name                     = "devstorageacct171"
    resource_group_name      = "dev-rg-1"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
      project     = "projectA"
    }
  }
}
vms = {
  vm1 = {
    nic_name       = "frontend_nic_dev"
    location       = "Central India"
    rg_name        = "dev-rg-1"
    vnet_name      = "dev-vnet-1"
    subnet_name    = "frontendsubnet_dev"
    pip_name       = "frontend-pip-dev"
    vm_name        = "frontend-vm-dev"
    size           = "Standard_B1s"
    admin_username = "azureuser"
    admin_password = "StrongP@ssword123"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    nic_name       = "backend_nic_dev"
    location       = "Central India"
    rg_name        = "dev-rg-1"
    vnet_name      = "dev-vnet-1"
    subnet_name    = "backendsubnet_dev"
    pip_name       = "backend-pip-dev"
    vm_name        = "backend-vm-dev"
    size           = "Standard_B1s"
    admin_username = "azureuser"
    admin_password = "StrongP@ssword123"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
NSG = {
  web = {
    name                = "web-nsg"
    location            = "Central India"
    rg_name = "dev-rg-1"
    vnet_name           = "dev-vnet-1"
    subnet_name         = "frontendsubnet_dev"

    security_rule = {
      "allow-ssh" = {
        name                       = "Allow-SSH"
        priority                   = 100
        direction                   = "Inbound"
        access                      = "Allow"
        protocol                    = "Tcp"
        source_port_range           = "*"
        destination_port_range      = "22"
        source_address_prefix       = "*"
        destination_address_prefix  = "*"
      }
    }
  }
}
