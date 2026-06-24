variable "node_name" {
  description = "The Proxmox node name."
  type        = string
}

variable "datastore_id" {
  description = "The datastore ID on Proxmox."
  type        = string
  default     = "local"
}

variable "url" {
  description = "The URL of the file to download."
  type        = string
}

variable "content_type" {
  description = "The file content type."
  type        = string
}

variable "checksum" {
  description = "The checksum of the file."
  type        = string
  default     = null
}

variable "checksum_algorithm" {
  description = "The algorithm used for the checksum."
  type        = string
  default     = null
}

variable "decompression_algorithm" {
  description = "The decompression algorithm for the file"
  type        = string
  default     = null
}

variable "file_name" {
  description = "The file name of the file. If unset, will be infered from the URL."
  type        = string
  default     = null
}

variable "overwrite" {
  description = "Whether to overwrite the file if changes are detected or if a new version is available."
  type        = bool
  default     = false
}
