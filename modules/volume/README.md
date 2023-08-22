## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.42.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_volume.disk](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable or disable delete protection. | `bool` | `false` | no |
| <a name="input_format"></a> [format](#input\_format) | Format volume after creation. xfs or ext4. | `string` | `"ext4"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | User-defined labels (key-value pairs) should be created with. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The location name of the volume to create, not allowed if server\_id argument is passed. | `string` | n/a | yes |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | The absolute path which this volume will be mounted with. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Name of the server will attach to this volume. | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | Size of the volume (in GB). | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Unique ID of the volume. |
| <a name="output_labels"></a> [labels](#output\_labels) | Resource labels. |
| <a name="output_linux_device"></a> [linux\_device](#output\_linux\_device) | Device path on the file system for the Volume. |
| <a name="output_location"></a> [location](#output\_location) | The location name. |
| <a name="output_mount_path"></a> [mount\_path](#output\_mount\_path) | The absolute path which this volume will be mounted with. |
| <a name="output_name"></a> [name](#output\_name) | Name of the volume. |
| <a name="output_size"></a> [size](#output\_size) | Size of the volume. |
