resource "proxmox_virtual_environment_firewall_alias" "this" {
  for_each = { for v in var.firewall_aliases : v.name => v }

  name    = each.value.name
  cidr    = each.value.cidr
  comment = each.value.comment
}

resource "proxmox_virtual_environment_firewall_ipset" "this" {
  depends_on = [
    proxmox_virtual_environment_firewall_alias.this
  ]

  for_each = { for v in var.firewall_ipsets : v.name => v }

  name    = each.value.name
  comment = each.value.comment

  dynamic "cidr" {
    for_each = each.value.cidrs

    content {
      name    = cidr.value.cidr
      comment = cidr.value.comment
      nomatch = cidr.value.nomatch
    }
  }
}

resource "proxmox_virtual_environment_cluster_firewall_security_group" "this" {
  depends_on = [
    proxmox_virtual_environment_firewall_alias.this,
    proxmox_virtual_environment_firewall_ipset.this
  ]

  for_each = { for v in var.firewall_security_groups : v.name => v }

  name    = each.value.name
  comment = each.value.comment

  dynamic "rule" {
    for_each = each.value.rules

    content {
      action  = rule.value.action
      type    = rule.value.type
      comment = rule.value.comment
      enabled = rule.value.enabled
      source  = rule.value.source
      sport   = rule.value.sport
      dest    = rule.value.dest
      dport   = rule.value.dport
      iface   = rule.value.iface
      log     = rule.value.log
      macro   = rule.value.macro
      proto   = rule.value.proto
    }
  }
}

resource "proxmox_virtual_environment_firewall_rules" "this" {
  depends_on = [
    proxmox_virtual_environment_firewall_alias.this,
    proxmox_virtual_environment_firewall_ipset.this
  ]

  dynamic "rule" {
    for_each = var.firewall_rules

    content {
      comment        = rule.value.comment
      enabled        = rule.value.enabled
      iface          = rule.value.iface
      security_group = rule.value.security_group
      proto          = rule.value.proto
      macro          = rule.value.macro
      type           = rule.value.type
      action         = rule.value.action
      source         = rule.value.source
      sport          = rule.value.sport
      dest           = rule.value.dest
      dport          = rule.value.dport
      log            = rule.value.log
    }
  }
}

resource "proxmox_virtual_environment_cluster_firewall" "this" {
  depends_on = [
    proxmox_virtual_environment_firewall_rules.this
  ]

  enabled        = var.firewall_enabled
  ebtables       = var.firewall_ebtables_enabled
  input_policy   = var.firewall_input_policy
  output_policy  = var.firewall_output_policy
  forward_policy = var.firewall_forward_policy

  log_ratelimit {
    enabled = var.firewall_log_ratelimit_enabled
    burst   = var.firewall_log_ratelimit_burst
    rate    = var.firewall_log_ratelimit_rate
  }
}
