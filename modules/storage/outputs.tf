output "directory_ids" {
  description = "IDs of the directory storage."
  value       = [for storage in proxmox_storage_directory.this : storage.id]
}

output "lvm_thin_ids" {
  description = "IDs of the LVM thin storage."
  value       = [for storage in proxmox_storage_lvmthin.this : storage.id]
}
