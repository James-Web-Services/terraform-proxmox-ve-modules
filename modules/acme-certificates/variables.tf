variable "node_name" {
  description = "The Proxmox node name."
  type        = string
}

variable "certificates" {
  description = "Map of certificates to create."

  type = map(object({
    account = string
    force   = optional(bool, false)

    domains = list(object({
      domain = string
      alias  = optional(string)
      plugin = optional(string)
    }))
  }))

  default = {}
}
