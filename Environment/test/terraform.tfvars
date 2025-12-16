Resource_group = {
  "rg1" = {
    name       = "to-do-rg"
    location   = "australiaeast"
    managed_by = "terraform"
    tags = {
      owner = "jitu"
    }
  }
  "rg2" = {
    name     = "netflix-rg"
    location = "australiaeast"

  }
}
networking = {
  "vnet1" = {
    name                = "todovnet"
    location            = "australiaeast"
    resource_group_name = "to-do-rg"
    address_space       = ["10.0.0.0/16"]
    subnet = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
  "vnet2" = {
    name                = "netflixvnet"
    location            = "australiaeast"
    resource_group_name = "netflix-rg"
    address_space       = ["10.0.0.0/16"]

  }
}
publicip = {
  "pip1" = {
    name                = "frontend-pip"
    resource_group_name = "to-do-rg"
    location            = "australiaeast"
    allocation_method   = "Static"
  }
  "pip2" = {
    name                = "backend-pip"
    resource_group_name = "to-do-rg"
    location            = "australiaeast"
    allocation_method   = "Static"
  }
}
vms = {
  "vm1" = {
    nicname     = "frontendvmnic"
    vmname      = "frontendvm"
    size        = "Standard_D2s_v3"
    script_name = "nginx.sh"

    admin_username = "adminuser"
    admin_password = "Jitupooja13@"
    os_disk = {
      os1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    source_image_reference = {
      source1 = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }
    resource_group_name  = "to-do-rg"
    location             = "australiaeast"
    subnetname           = "frontend-subnet"
    virtual_network_name = "todovnet"
    publicipname         = "frontend-pip"
    ip_configuration = {
      "ip1" = {
        ipconfigname                  = "frontendvmnicip"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
  "vm2" = {
    nicname        = "backendvmnic"
    vmname         = "backendvm"
    size           = "Standard_D2s_v3"
    script_name    = "nginx.sh"
    admin_username = "adminuser"
    admin_password = "Jitupooja13@"
    os_disk = {
      os1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    source_image_reference = {
      source1 = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }
    resource_group_name  = "to-do-rg"
    location             = "australiaeast"
    subnetname           = "backend-subnet"
    virtual_network_name = "todovnet"
    publicipname         = "backend-pip"
    ip_configuration = {
      "ip1" = {
        ipconfigname                  = "backendvmnicip"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}
server = {
  "server1" = {
    dbservername                 = "todo-server-2214"
    resource_group_name          = "to-do-rg"
    location                     = "australiaeast"
    dbserverversion              = "12.0"
    administrator_login          = "todo-admin"
    administrator_login_password = "Jitupooja13@"
    minimum_tls_version          = "1.2"
    tags = {
      environment = "test"
    }
  }
}
tododb = {
  "db1" = {
    tododbname          = "tododb"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
    dbservername        = "todo-server-2214"
    resource_group_name = "to-do-rg"
    tags = {
      environment = "test"
    }
  }
}




