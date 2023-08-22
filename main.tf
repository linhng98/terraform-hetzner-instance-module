resource "hcloud_server" "instance" {
  name        = var.name
  server_type = var.server_type
  image       = var.image
  location    = var.location
  datacenter  = var.datacenter
  user_data   = var.user_data
  ssh_keys    = var.ssh_keys
  public_net {
    ipv4_enabled = var.public_net.ipv4_enabled
    ipv6_enabled = var.public_net.ipv6_enabled
    ipv4         = var.public_net.ipv4
  }
  keep_disk          = var.keep_disk
  iso                = var.iso
  rescue             = var.rescue
  labels             = var.labels
  backups            = var.backups
  firewall_ids       = var.firewall_ids
  placement_group_id = var.placement_group_id
}

resource "hcloud_server_network" "network" {
  server_id = hcloud_server.instance.id
  alias_ips = var.network_config.alias_ips
  ip        = var.network_config.ip
  subnet_id = var.network_config.subnet_id
}

resource "hcloud_volume_attachment" "volume" {
  count     = length(var.attach_volumes)
  volume_id = var.attach_volumes[count.index]
  server_id = hcloud_server.instance.id
  automount = false
}
