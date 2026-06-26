resource "proxmox_acme_dns_plugin" "this" {
  for_each = { for plugin in var.plugins : plugin.id => plugin }

  plugin           = each.value.id
  api              = each.value.api
  data             = sensitive(each.value.data)
  data_wo          = sensitive(each.value.data_wo)
  data_wo_version  = each.value.data_wo_version
  digest           = each.value.digest
  validation_delay = each.value.validation_delay
  disable          = !each.value.enabled
}
