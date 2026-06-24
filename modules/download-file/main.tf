resource "proxmox_download_file" "this" {
  node_name               = var.node_name
  datastore_id            = var.datastore_id
  url                     = var.url
  content_type            = var.content_type
  checksum                = var.checksum
  checksum_algorithm      = var.checksum_algorithm
  decompression_algorithm = var.decompression_algorithm
  file_name               = var.file_name
  overwrite               = var.overwrite
}
