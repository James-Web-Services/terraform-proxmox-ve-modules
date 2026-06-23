variable "firewall_enabled" {
  description = "Whether to enable the cluster firewall."
  type        = bool
  default     = false
}

variable "firewall_ebtables_enabled" {
  description = "Whether to enable ebtables."
  type        = bool
  default     = true
}

variable "firewall_input_policy" {
  description = "Firewall input policy."
  type        = string
  default     = "DROP"
}

variable "firewall_output_policy" {
  description = "Firewall output policy."
  type        = string
  default     = "ACCEPT"
}

variable "firewall_forward_policy" {
  description = "Firewall forward policy."
  type        = string
  default     = "ACCEPT"
}

variable "firewall_log_ratelimit_enabled" {
  description = "Whether to enable the log ratelimit."
  type        = bool
  default     = true
}

variable "firewall_log_ratelimit_burst" {
  description = "The log ratelimit burst."
  type        = number
  default     = 5
}

variable "firewall_log_ratelimit_rate" {
  description = "The log ratelimit rate."
  type        = string
  default     = "1/second"
}

variable "firewall_aliases" {
  description = "List of firewall aliases."

  type = list(object({
    name    = string
    cidr    = string
    comment = string
  }))

  default = []
}

variable "firewall_ipsets" {
  description = "List of firewall IPsets."

  type = list(object({
    name    = string
    comment = string

    cidrs = optional(list(object({
      cidr    = string
      comment = string
      nomatch = optional(bool, false)
    })), [])
  }))

  default = []
}

variable "firewall_security_groups" {
  description = "List of firewall security groups."

  type = list(object({
    name    = string
    comment = string

    rules = optional(list(object({
      action  = string
      type    = string
      comment = string
      enabled = optional(bool, true)
      source  = optional(string)
      sport   = optional(string)
      dest    = optional(string)
      dport   = optional(string)
      iface   = optional(string)
      log     = optional(string)
      macro   = optional(string)
      proto   = optional(string)
    })), [])
  }))

  default = []
}

variable "firewall_rules" {
  description = "List of firewall rules."

  type = list(object({
    comment        = string
    enabled        = optional(bool, true)
    iface          = optional(string, "net0")
    security_group = optional(string)
    proto          = optional(string)
    macro          = optional(string)
    type           = optional(string)
    action         = optional(string)
    source         = optional(string)
    sport          = optional(string)
    dest           = optional(string)
    dport          = optional(string)
    log            = optional(string)
  }))

  default = []
}
