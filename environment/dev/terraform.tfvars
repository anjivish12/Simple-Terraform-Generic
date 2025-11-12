rgs = {
  todo-app = {
    name = "todo-app"
    location = "West US"    
  }
}

vnets = {
  todo-vnet = {
    name = "todo-vnet"
    resource_group_name = "todo-app"
    location = "West US"
    address_space = ["10.0.0.0/16"]

    subnet = [
        {
            name = "frontend-subnet"
            address_prefixes = ["10.0.1.0/24"] 
        },
        {
            name = "backend-subnet"
            address_prefixes = ["10.0.2.0/24"] 
        }

    ]
  }
}

pips = {
    pip1 = {
        name = "frontend-pip"
        resource_group_name = "todo-app"
        location = "West US"
        allocation_method = "Static"
    }
    pip2 = {
        name = "backend-pip"
        resource_group_name = "todo-app"
        location = "West US"
        allocation_method = "Static"
    }
}

nsgs = {
    nsg1 = {
        name = "frontend-nsg"
        resource_group_name = "todo-app"
        location = "West US"
        subnet_name = "frontend-subnet"
        vnet_name = "todo-vnet"

        security_rule = [{
          access = "Allow"
          destination_address_prefix = "*"
          destination_port_range = "*"
          name = "AllowSSH"
          priority = 100
          protocol = "Tcp"
          source_address_prefix = "*"
          source_port_range = "*"
          direction = "Inbound"
        }]
    }
    nsg2 = {
        name = "backend-nsg"
        resource_group_name = "todo-app"
        location = "West US"
        subnet_name = "backend-subnet"
        vnet_name = "todo-vnet"

        security_rule = [{
          access = "Allow"
          destination_address_prefix = "*"
          destination_port_range = "*"
          name = "AllowSSH"
          priority = 102
          protocol = "Tcp"
          source_address_prefix = "*"
          source_port_range = "*"
          direction = "Inbound"
        }]
    }
}

keys = {
  key1 = {
    name = "todoapp-key1"
    resource_group_name = "todo-app"
    location = "West US"
    sku_name = "standard"
  }
}

secrets = {
  secret1 = {
    key_name = "todoapp-key1"
    resource_group_name = "todo-app"
    secret_name = "vm1"
    secret_value = "anjali1"
  }
  secret2 = {
    key_name = "todoapp-key1"
    resource_group_name = "todo-app"
    secret_name = "password1"
    secret_value = "anjali@12345"
  }
  secret3 = {
    key_name = "todoapp-key1"
    resource_group_name = "todo-app"
    secret_name = "vm2"
    secret_value = "anjali2"
  }
    secret4 = {
    key_name = "todoapp-key1"
    resource_group_name = "todo-app"
    secret_name = "password2"
    secret_value = "anjali@12345"
  }
}

vms = {
    vm1 = {
        subnet_name = "frontend-subnet"
        vnet_name = "todo-vnet"
        pip_name = "frontend-pip"
        key_name = "todoapp-key1"
        secret_name = "vm1"
        secret_value = "password1"

        nic_name = "frontend-nic"
        location = "West US"
        resource_group_name = "todo-app"
        ip_configuration = [{
                  name = "internal"
                  private_ip_address_allocation = "Dynamic"
        }]

        vm_name = "frontend-vm"
        size = "Standard_F2"
        script_name = "./nginx.sh"
        os_disk = [
            {
                caching              = "ReadWrite"
                storage_account_type = "Standard_LRS"
            }
        ]
        source_image_reference = [
            {
                publisher = "Canonical"
                offer     = "0001-com-ubuntu-server-jammy"
                sku       = "22_04-lts"
                version   = "latest"
            }
        ]

    }
     vm2 = {
        subnet_name = "backend-subnet"
        vnet_name = "todo-vnet"
        pip_name = "backend-pip"
        key_name = "todoapp-key1"
        secret_name = "vm2"
        secret_value = "password2"

        nic_name = "backend-nic"
        location = "West US"
        resource_group_name = "todo-app"
        ip_configuration = [{
                  name = "internal"
                  private_ip_address_allocation = "Dynamic"
        }]

        vm_name = "vm2"
        size = "Standard_F2"

        os_disk = [
            {
                caching              = "ReadWrite"
                storage_account_type = "Standard_LRS"
            }
        ]
        source_image_reference = [
            {
                publisher = "Canonical"
                offer     = "0001-com-ubuntu-server-jammy"
                sku       = "22_04-lts"
                version   = "latest"
            }
        ]

    }
}

servers = {
  server1 = {
    name = "anjaliserver1"
    location = "West US"
    resource_group_name = "todo-app"
    administrator_login = "server12"
    administrator_login_password = "Anjali@12345"
    version                      = "12.0"
    # azuread_administrator  = [
    #   {
    #     login_username = "AzureAD Admin"
    #     object_id      = "63cd5982-688a-41ad-8df4-c035626b22df"
    #   }  ]
  }
}

databases = {
  db1 = {
      name = "anjalidb121"
      server_name = "anjaliserver1"
      resource_group_name = "todo-app"
      collation    = "SQL_Latin1_General_CP1_CI_AS"
      license_type = "LicenseIncluded"
      max_size_gb  = 2
      sku_name     = "S0"
      enclave_type = "VBS"
  }
}


stgs = {
  stg1 = {
    name = "stganji1289"
    location = "West US"
    resource_group_name = "todo-app"
    account_tier             = "Standard"
    account_replication_type = "GRS"

  }
}

acrs = {
    acr1 = {
        name = "acrwanjali1"
        resource_group_name = "todo-app"
        location = "West US"
        sku = "Premium"
        admin_enabled = false
    }
}

aks = {
    aks1 = {
        name = "aks-1"
        resource_group_name = "todo-app"
        location = "Central US"
        dns_prefix = "dns1"
        default_node_pool = [{
           name       = "default"
           node_count = 1
           vm_size    = "Standard_A2_v2"
        }]
        identity = [{
            type = "SystemAssigned"
        }]

    }
}