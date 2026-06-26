output "bonds" {
  description = "Bonds created."
  value = {
    for k, v in proxmox_network_linux_bond.this : k => {
      id = v.id
    }
  }
}

output "bridges" {
  description = "Bridges created."
  value = {
    for k, v in proxmox_network_linux_bridge.this : k => {
      id = v.id
    }
  }
}


output "vlans" {
  description = "VLANs created."
  value = {
    for k, v in proxmox_network_linux_vlan.this : k => {
      id = v.id
    }
  }
}
