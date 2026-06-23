resource "proxmox_acme_certificate" "this" {
  for_each = var.certificates

  node_name = var.node_name
  account   = each.value.account
  force     = each.value.force

  domains = [
    for domain in each.value.domains : {
      domain = domain.domain
      alias  = domain.alias
      plugin = domain.plugin
    }
  ]
}
