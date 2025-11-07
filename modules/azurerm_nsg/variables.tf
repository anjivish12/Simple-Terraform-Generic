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

