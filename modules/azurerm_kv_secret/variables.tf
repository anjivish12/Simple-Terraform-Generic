variable "secrets" {

    type = map(object({
      key_name = string
      resource_group_name = string
      secret_name = string
      secret_value = string
    }))
}