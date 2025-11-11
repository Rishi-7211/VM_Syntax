resource_groups = {
  rg1 = {
    name     = "prod-rg-1"
    location = "Central India"
    tags = {
      environment = "prod"
      project     = "projectA"
    }
    managed_by = "teamA"
  }
    rg2 = {
    name     = "prod-rg-2"
    location = "East US"
    tags = {
      environment = "prod"
      project     = "projectA"
    }
    managed_by = "teamA"
  }

}
virtual_networks = {
  vnet1 = {
    name                = "prod-vnet-1"
    address_space       = ["10.0.0.0/16"]
    location            = "Central India"
    resource_group_name = "prod-rg-1"
    tags = {
      environment = "prod"
      project     = "projectA"
    }
    subnets = [
      {
        name             = "frontendsubnet_prod"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backendsubnet_prod"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ips = {
  pip1 = {
    name                = "frontend-pip-prod"
    location            = "Central India"
    resource_group_name = "prod-rg-1"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "prod"
      project     = "projectA"
    }
  }
  pip2 = {
    name                = "backend-pip-prod"
    location            = "Central India"
    resource_group_name = "prod-rg-1"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "prod"
      project     = "projectA"
    }
  }
}
key_vaults = {
  kv1 = {
    name                = "keyvault-prod-72112"
    location            = "Central India"
    resource_group_name = "prod-rg-1"
    sku_name            = "standard"
    tenant_id           = "e2812fdf-98fe-4c59-b46d-db67506f1035"
    tags = {
      environment = "prod"
      project     = "projectA"
    }
  }
}
storage_accounts = {
  sa1 = {
    name                     = "prodstorageacct171"
    resource_group_name      = "prod-rg-1"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "prod"
      project     = "projectA"
    }
  }
}
vms = {
  vm1 = {
    nic_name       = "frontend_nic_prod"
    location       = "Central India"
    rg_name        = "prod-rg-1"
    vnet_name      = "prod-vnet-1"
    subnet_name    = "frontendsubnet_prod"
    pip_name       = "frontend-pip-prod"
    vm_name        = "frontend-vm-prod"
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
    nic_name       = "backend_nic_prod"
    location       = "Central India"
    rg_name        = "prod-rg-1"
    vnet_name      = "prod-vnet-1"
    subnet_name    = "backendsubnet_prod"
    pip_name       = "backend-pip-prod"
    vm_name        = "backend-vm-prod"
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
    name        = "web-nsg"
    location    = "Central India"
    rg_name     = "prod-rg-1"
    vnet_name   = "prod-vnet-1"
    subnet_name = "frontendsubnet_prod"

    security_rule = {
      "allow-ssh" = {
        name                       = "Allow-SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

Sqlserver = {
  sql1 = {
    name                         = "mysqlserver987"
    resource_group_name           = "prod-rg-1"
    location                      = "Central India"
    version                       = "12.0"
    administrator_login           = "Mysqlserver"
    administrator_login_password  = "prodops@1234"
    public_network_access_enabled = false
    minimum_tls_version           = "1.2"

    databases = {
      db1 = {
        name         = "webappdb"
        sku_name     = "S0"
        max_size_gb  = 10
        collation    = "SQL_Latin1_General_CP1_CI_AS"
      }

      db2 = {
        name         = "logdb"
        sku_name     = "Basic"
        max_size_gb  = 2
      }
    }
  }

  sql2 = {
    name                         = "mysqlserver-prod"
    resource_group_name           = "prod-rg-1"
    location                      = "Central India"
    administrator_login           = "adminsql"
    administrator_login_password  = "prod@1234"
    public_network_access_enabled = true

    databases = {
      db1 = {
        name        = "maindb"
        sku_name    = "S1"
        max_size_gb = 50
      }
    }
  }
}

AKS = {
  "cluster1" = {
    name     = "aks-cluster-eastus"
    location = "East US"
    rg_name  = "prod-rg-2"
  }
}
ACR = {
  acr1 = {
    name              = "prodacr7211"
    rg_name           = "prod-rg-1"
    location          = "Central India"
    environment       = "prodelopment"
    tags              = { Owner = "Rishikesh" }
    replica_locations = ["East US", "North Europe"]
  }
}