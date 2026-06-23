output "firewall_alias_references" {
  description = "Firewall alias references for use in other rules."
  value = {
    for k, v in proxmox_virtual_environment_firewall_alias.this : k => "dc/${v.name}"
  }
}

output "firewall_ipset_references" {
  description = "Firewall IPset references for use in other rules."
  value = {
    for k, v in proxmox_virtual_environment_firewall_ipset.this : k => "+dc/${v.name}"
  }
}

output "firewall_security_group_references" {
  description = "Firewall security group references for use in other rules."
  value = {
    for k, v in proxmox_virtual_environment_cluster_firewall_security_group.this : k => v.name
  }
}
