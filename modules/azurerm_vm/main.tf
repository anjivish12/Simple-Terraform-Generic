
resource "azurerm_network_interface" "nic" {
    for_each = var.vms

    name = each.value.nic_name
    resource_group_name = each.value.resource_group_name
    location = each.value.location

    dynamic "ip_configuration" {

        for_each = each.value.ip_configuration == null ? [] : each.value.ip_configuration
        content {
          name = ip_configuration.value.name
          private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
          subnet_id = data.azurerm_subnet.subnetid[each.key].id
          public_ip_address_id = data.azurerm_public_ip.pipid[each.key].id
        }      
    }
}

resource "azurerm_linux_virtual_machine" "vm" {

    for_each = var.vms
    name = each.value.vm_name
    location =  each.value.location
    resource_group_name =  each.value.resource_group_name
    admin_username = data.azurerm_key_vault_secret.admin_name[each.key].name
    admin_password = data.azurerm_key_vault_secret.admin_password[each.key].value
    disable_password_authentication = false
    size = each.value.size

    network_interface_ids = [azurerm_network_interface.nic[each.key].id]

    dynamic "os_disk" {
        for_each = each.value.os_disk == null ? [] : each.value.os_disk
        content {
          caching = os_disk.value.caching
          storage_account_type = os_disk.value.storage_account_type
        }
    }

    dynamic "source_image_reference" {
        for_each = each.value.source_image_reference == null ? [] : each.value.source_image_reference
        content {
            publisher = source_image_reference.value.publisher
            version = source_image_reference.value.version
            sku = source_image_reference.value.sku
            offer = source_image_reference.value.offer
        } 
    }
    custom_data = base64encode(<<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install nginx -y
              sudo systemctl enable nginx
              sudo systemctl start nginx
              echo "<h1>Welcome to NGINX - deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
          EOF
  )
}