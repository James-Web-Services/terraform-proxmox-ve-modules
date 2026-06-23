<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 0.100.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [proxmox_acme_dns_plugin.this](https://registry.terraform.io/providers/bpg/proxmox/0.100.0/docs/resources/acme_dns_plugin) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_plugins"></a> [plugins](#input\_plugins) | List of DNS plugins. | <pre>list(object({<br/>    name             = string<br/>    api              = string<br/>    data             = optional(map(string))<br/>    enabled          = optional(bool, true)<br/>    validation_delay = optional(number, 30)<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_plugin_names"></a> [plugin\_names](#output\_plugin\_names) | Names of the DNS plugins. |
<!-- END_TF_DOCS -->
