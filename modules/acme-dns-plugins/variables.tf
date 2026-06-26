variable "plugins" {
  description = "List of DNS plugins."

  type = list(object({
    id               = string
    api              = string
    data             = optional(map(string))
    data_wo          = optional(map(string))
    data_wo_version  = optional(number)
    digest           = optional(string)
    enabled          = optional(bool, true)
    validation_delay = optional(number, 30)
  }))

  default = []
}
