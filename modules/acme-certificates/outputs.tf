output "ids" {
  description = "IDs of the ACME certificates."
  value       = [for cert in proxmox_acme_certificate.this : cert.id]
}
