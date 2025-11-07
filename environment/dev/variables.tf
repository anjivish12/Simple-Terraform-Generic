variable "rgs" {
    type = map(object({
      name = string
      location = string
    }))
  
}

variable "vnets" {
    type = map(object({
        name = string
        resource_group_name = string
        location = string
        address_space = list(string)

        subnet = list(object({
          name = string
          address_prefixes = list(string) 
        }))
    }))
}
variable "pips" {
    type = map(object({
      name = string
      resource_group_name = string
      location = string
      allocation_method = string
    }))
}

variable "nsgs" {
    type = map(object({

      name = string
      resource_group_name = string
      location = string
      security_rule = list(object({
        name = string
        priority = number
        access = string
        protocol = string
        source_port_range = string
        destination_port_range = string
        source_address_prefix = string
        destination_address_prefix = string
        direction = string
      })) 
      subnet_name = string
      vnet_name = string
    }))
}

variable "keys" {
    type = map(object({
      name = string
      resource_group_name = string
      location = string
      sku_name = string
    }))
}

variable "secrets" {

    type = map(object({
      key_name = string
      resource_group_name = string
      secret_name = string
      secret_value = string
    }))
}

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

variable "servers" {
    type = map(object({
      name = string
      resource_group_name = string
      location = string
      version = string
      administrator_login = optional(string)
      administrator_login_password = optional(string)
      minimum_tls_version = optional(string)
      tags = optional(map(string))
     azuread_administrator = optional(list(object({
        login_username = string
        object_id = string
      })))
    }))
}

variable "databases" {
    type = map(object({
      name = string
        server_name = string
        resource_group_name = string
      collation = optional(string)
      license_type = optional(string)
      max_size_gb = optional(number)
      sku_name = optional(string)
      enclave_type = optional(string)
      tags = optional(map(string))

    }))
  
}



