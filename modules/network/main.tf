resource "proxmox_network_linux_bond" "this" {
  for_each = { for v in var.bonds : v.name => v }

  node_name             = var.node_name
  name                  = each.value.name
  slaves                = each.value.slaves
  comment               = each.value.comment
  address               = each.value.address
  address6              = each.value.address6
  autostart             = each.value.autostart
  bond_mode             = each.value.bond_mode
  bond_primary          = each.value.bond_primary
  bond_xmit_hash_policy = each.value.bond_xmit_hash_policy
  gateway               = each.value.gateway
  gateway6              = each.value.gateway6
  mtu                   = each.value.mtu
  timeout_reload        = each.value.timeout_reload
}

resource "proxmox_network_linux_vlan" "this" {
  for_each = { for v in var.vlans : v.name => v }

  node_name      = var.node_name
  name           = each.value.name
  comment        = each.value.comment
  address        = each.value.address
  address6       = each.value.address6
  autostart      = each.value.autostart
  gateway        = each.value.gateway
  gateway6       = each.value.gateway6
  interface      = each.value.interface
  mtu            = each.value.mtu
  timeout_reload = each.value.timeout_reload
  vlan           = each.value.vlan
}

resource "proxmox_network_linux_bridge" "this" {
  depends_on = [
    proxmox_network_linux_vlan.this
  ]

  for_each = { for v in var.bridges : v.name => v }

  node_name      = var.node_name
  name           = each.value.name
  comment        = each.value.comment
  address        = each.value.address
  address6       = each.value.address6
  autostart      = each.value.autostart
  gateway        = each.value.gateway
  gateway6       = each.value.gateway6
  mtu            = each.value.mtu
  ports          = each.value.ports
  timeout_reload = each.value.timeout_reload
  vids           = each.value.vids
  vlan_aware     = each.value.vlan_aware
}
