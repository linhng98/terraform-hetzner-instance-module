## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.42.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_server.instance](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_server_network.network](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network) | resource |
| [hcloud_volume_attachment.volume](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_volumes"></a> [attach\_volumes](#input\_attach\_volumes) | List volume id to attach with. | `list(string)` | `[]` | no |
| <a name="input_backups"></a> [backups](#input\_backups) | Enable or disable backups. | `bool` | `false` | no |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | The datacenter name to create the server in. nbg1-dc3, fsn1-dc14, hel1-dc2, ash-dc1 or hil-dc1. | `string` | `null` | no |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | Firewall IDs the server should be attached to on creation. | `list(string)` | `[]` | no |
| <a name="input_image"></a> [image](#input\_image) | Name or ID of the image the server is created from. | `string` | n/a | yes |
| <a name="input_iso"></a> [iso](#input\_iso) | ID or Name of an ISO image to mount. | `string` | `null` | no |
| <a name="input_keep_disk"></a> [keep\_disk](#input\_keep\_disk) | If true, do not upgrade the disk. This allows downgrading the server type later. | `bool` | `true` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | User-defined labels (key-value pairs) should be created with. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The location name to create the server in. nbg1, fsn1, hel1, ash or hil. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the server to create (must be unique per project and a valid hostname as per RFC 1123). | `string` | n/a | yes |
| <a name="input_network_config"></a> [network\_config](#input\_network\_config) | Network the server should be attached to on creation. | <pre>object({<br>    subnet_id = string<br>    ip        = optional(string)<br>    alias_ips = optional(list(string), [])<br>  })</pre> | n/a | yes |
| <a name="input_placement_group_id"></a> [placement\_group\_id](#input\_placement\_group\_id) | Placement Group ID the server added to on creation. | `string` | `null` | no |
| <a name="input_public_net"></a> [public\_net](#input\_public\_net) | In this block you can either enable / disable ipv4 and ipv6 or link existing primary IPs (checkout the examples). If this block is not defined, two primary (ipv4 & ipv6) ips getting auto generated. | <pre>object({<br>    ipv4_enabled = optional(bool, false)<br>    ipv4         = optional(string)<br>    ipv6_enabled = optional(bool, false)<br>  })</pre> | n/a | yes |
| <a name="input_rescue"></a> [rescue](#input\_rescue) | Enable and boot in to the specified rescue system. This enables simple installation of custom operating systems. linux64 or linux32 | `string` | `null` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Name of the server type this server should be created with. | `string` | n/a | yes |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | SSH key IDs or names which should be injected into the server at creation time. | `list(string)` | `[]` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Cloud-Init user data to use during server creation. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Unique ID of the server. |
| <a name="output_image"></a> [image](#output\_image) | Name or ID of the image the server was created from. |
| <a name="output_labels"></a> [labels](#output\_labels) | Resource labels. |
| <a name="output_location"></a> [location](#output\_location) | The location name. |
| <a name="output_name"></a> [name](#output\_name) | Name of the server. |
| <a name="output_network"></a> [network](#output\_network) | Server network. |
| <a name="output_server_type"></a> [server\_type](#output\_server\_type) | Name of the server type. |
| <a name="output_user_data"></a> [user\_data](#output\_user\_data) | n/a |
