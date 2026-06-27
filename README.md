# terraform-proxmox-ve-modules

This is a collection of Terraform/OpenTofu modules for use with Proxmox Virtual Environment. Modules primarily use the [bpg/proxmox](https://registry.terraform.io/providers/bpg/proxmox/latest) provider to manage resources.

## Authentication

The modules are tested with the [API token](https://registry.terraform.io/providers/bpg/proxmox/latest/docs#api-token-authentication) authentication method, but some also require an [SSH connection](https://registry.terraform.io/providers/bpg/proxmox/latest/docs#when-is-ssh-required) for modules that require uploading snippets (i.e., the virtual-machine module).
