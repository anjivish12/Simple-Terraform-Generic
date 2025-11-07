rgs = {
  rg1 = {
    name = "rg1"
    location = "West US"    
  }
}

vnets = {
  vnet1 = {
    name = "vnet1"
    resource_group_name = "rg1"
    location = "West US"
    address_space = ["10.0.0.0/16"]

    subnet = [
        {
            name = "subnet1"
            address_prefixes = ["10.0.1.0/24"] 
        },
        {
            name = "subnet2"
            address_prefixes = ["10.0.2.0/24"] 
        }

    ]
  }
}

pips = {
    pip1 = {
        name = "pip1"
        resource_group_name = "rg1"
        location = "West US"
        allocation_method = "Static"
    }
    pip2 = {
        name = "pip2"
        resource_group_name = "rg1"
        location = "West US"
        allocation_method = "Static"
    }
}

nsgs = {
    nsg1 = {
        name = "nsg1"
        resource_group_name = "rg1"
        location = "West US"
        subnet_name = "subnet1"
        vnet_name = "vnet1"

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
        name = "nsg2"
        resource_group_name = "rg1"
        location = "West US"
        subnet_name = "subnet2"
        vnet_name = "vnet1"

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
    name = "keyanji"
    resource_group_name = "rg1"
    location = "West US"
    sku_name = "standard"
  }
}

secrets = {
  secret1 = {
    key_name = "keyanji"
    resource_group_name = "rg1"
    secret_name = "vm1"
    secret_value = "anjali1"
  }
  secret2 = {
    key_name = "keyanji"
    resource_group_name = "rg1"
    secret_name = "password1"
    secret_value = "anjali@12345"
  }
  secret3 = {
    key_name = "keyanji"
    resource_group_name = "rg1"
    secret_name = "vm2"
    secret_value = "anjali2"
  }
    secret4 = {
    key_name = "keyanji"
    resource_group_name = "rg1"
    secret_name = "password2"
    secret_value = "anjali@12345"
  }
}

vms = {
    vm1 = {
        subnet_name = "subnet1"
        vnet_name = "vnet1"
        pip_name = "pip1"
        key_name = "keyanji"
        secret_name = "vm1"
        secret_value = "password1"

        nic_name = "nic1"
        location = "West US"
        resource_group_name = "rg1"
        ip_configuration = [{
                  name = "internal"
                  private_ip_address_allocation = "Dynamic"
        }]

        vm_name = "vm1"
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
     vm2 = {
        subnet_name = "subnet2"
        vnet_name = "vnet1"
        pip_name = "pip2"
        key_name = "keyanji"
        secret_name = "vm2"
        secret_value = "password2"

        nic_name = "nic2"
        location = "West US"
        resource_group_name = "rg1"
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
    resource_group_name = "rg1"
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
        resource_group_name = "rg1"
      collation    = "SQL_Latin1_General_CP1_CI_AS"
      license_type = "LicenseIncluded"
      max_size_gb  = 2
      sku_name     = "S0"
      enclave_type = "VBS"
  }
}