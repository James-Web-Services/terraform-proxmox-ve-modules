resource "proxmox_acme_dns_plugin" "this" {
  for_each = { for plugin in var.plugins : plugin.name => plugin }

  plugin           = each.value.name
  api              = each.value.api
  data             = sensitive(each.value.data)
  validation_delay = each.value.validation_delay
  disable          = !each.value.enabled
}
