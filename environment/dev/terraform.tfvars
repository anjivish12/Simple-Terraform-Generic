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
            address_prefixes = ["10.0.0.0/24"] 
        }
    ]
  }
}

pips = {
    key1 = {
        name = "pip1"
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
}

keys = {
  key1 = {
    name = "keyanjali1t"
    resource_group_name = "rg1"
    location = "West US"
    sku_name = "standard"
  }
}

secrets = {
  secret1 = {
    key_name = "keyanjali1t"
    resource_group_name = "rg1"
    secret_name = "vm1"
    secret_value = "Anjali"
  }
  secret2 = {
    key_name = "keyanjali1t"
    resource_group_name = "rg1"
    secret_name = "password"
    secret_value = "Anjali@12345"
  }
}

vms = {
    vm1 = {
        subnet_name = "subnet1"
        vnet_name = "vnet1"
        pip_name = "pip1"
        key_name = "keyanjali1t"
        secret_name = "vm1"
        secret_value = "password"

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
}