resource "proxmox_storage_directory" "this" {
  for_each = { for v in var.directory : v.id => v }

  id               = each.value.id
  nodes            = each.value.nodes
  path             = each.value.path
  content          = each.value.content
  create_base_path = each.value.create_base_path
  create_subdirs   = each.value.create_subdirs
  preallocation    = each.value.preallocation
  shared           = each.value.shared
  disable          = !each.value.enabled
}

resource "proxmox_storage_lvmthin" "this" {
  for_each = { for v in var.lvm_thin : v.id => v }

  id           = each.value.id
  nodes        = each.value.nodes
  volume_group = each.value.volume_group
  thin_pool    = each.value.thin_pool
  content      = each.value.content
  disable      = !each.value.enabled
}
