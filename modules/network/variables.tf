variable "node_name" {
  description = "The Proxmox node name."
  type        = string
}

variable "bonds" {
  description = "List of bonds to create."

  type = list(object({
    name                  = string
    slaves                = list(string)
    comment               = string
    address               = optional(string)
    address6              = optional(string)
    autostart             = optional(bool)
    bond_mode             = optional(string)
    bond_primary          = optional(string)
    bond_xmit_hash_policy = optional(string)
    gateway               = optional(string)
    gateway6              = optional(string)
    mtu                   = optional(number)
    timeout_reload        = optional(number)
  }))

  default = []
}

variable "vlans" {
  description = "List of VLANs to create."

  type = list(object({
    name           = string
    comment        = string
    address        = optional(string)
    address6       = optional(string)
    autostart      = optional(bool)
    gateway        = optional(string)
    gateway6       = optional(string)
    interface      = optional(string)
    mtu            = optional(number)
    timeout_reload = optional(number)
    vlan           = optional(number)
  }))

  default = []
}


variable "bridges" {
  description = "List of bridges to create."

  type = list(object({
    name           = string
    comment        = string
    address        = optional(string)
    address6       = optional(string)
    autostart      = optional(bool)
    gateway        = optional(string)
    gateway6       = optional(string)
    mtu            = optional(number)
    ports          = optional(list(string))
    timeout_reload = optional(number)
    vids           = optional(string)
    vlan_aware     = optional(bool)
  }))

  default = []
}
