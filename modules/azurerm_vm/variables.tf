variable "vms" {
    type = map(object({
      
    #   Data value
    subnet_name = string
    vnet_name = string
    pip_name = string
    key_name = string
    secret_name = string
    secret_value = string

    # Nic variables
    nic_name = string
    resource_group_name = string
    location = string

    ip_configuration = list(object({
        name = string
        private_ip_address_allocation = string
    })) 
    #  VM variables

    vm_name = string
    size = string
    os_disk = list(object({
      caching = string
      storage_account_type = string 
    }))

    source_image_reference = list(object({
        publisher = string
        offer = string
        sku = string
        version = string
    }))
    }))
}





