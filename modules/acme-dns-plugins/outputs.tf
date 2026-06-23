output "plugin_names" {
  description = "Names of the DNS plugins."
  value       = [for plugin in proxmox_acme_dns_plugin.this : plugin.plugin]
}
