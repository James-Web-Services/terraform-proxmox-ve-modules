variable "directory" {
  description = "List of directory storage to create."

  type = list(object({
    id               = string
    path             = string
    content          = optional(list(string))
    create_base_path = optional(bool)
    create_subdirs   = optional(bool)
    nodes            = optional(list(string))
    preallocation    = optional(string)
    shared           = optional(bool)
    enabled          = optional(bool, true)
  }))
}

variable "lvm_thin" {
  description = "List of LVM-thin storage to create."

  type = list(object({
    id           = string
    thin_pool    = string
    volume_group = string
    content      = optional(list(string))
    nodes        = optional(list(string))
    enabled      = optional(bool, true)
  }))

  default = []
}
