variable "plugins" {
  description = "List of DNS plugins."

  type = list(object({
    name             = string
    api              = string
    data             = optional(map(string))
    enabled          = optional(bool, true)
    validation_delay = optional(number, 30)
  }))

  default = []
}
