locals {
  server_name = "test-instance"
  location    = "fsn1"
}

resource "hcloud_network" "mynet" {
  name     = "my-net"
  ip_range = "10.0.0.0/8"
}
resource "hcloud_network_subnet" "foonet" {
  network_id   = hcloud_network.mynet.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_ssh_key" "default" {
  name       = "sshkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3nj/HBFmqS/LE/RFtV5XDCVEAY2y2o1JdKIN4USMhzOOIhJCDtQbTakfPF8AC9+GeLrG9fs2Jv638Phvs5nOkGYdt0ekoq1Bv6F96wClhMKugeh36v3lRUW3lhhxNUmq8FpdpjYHJeJ6jTnLU//q3SmNDytKmRne7+8g3MDdzubJ6cQRJyxnaM7ctbhRPFfZoW/tHWXYKsz+ub8CPL2JdH7fOT1LzPIwax4H2XQJ+7ZLT0yhHj1t2yTBUibpvpMOe79zmLMrXovmv+tHqBzRjEhtg8utsrtcjhk06xMMGh8HISuYQNZet5v7XpChgqxlawPBCmSnChcSRsOdG7nEOhGDizgVUM6lzapUEDdA7+2co8d6GEe2yjdfl95oG9GtoTtK0pNXljNlZ0nCUZSHdI6GxARNgB+c/0Ubfju8BaHeYYti7I+JqGPKOSp3tje4Ntv69lMtaeBzrTWdQCD7zg42y+HLcc7S8J1Bd4S7ndt15L/RMWk8BPB2nrAqa/9/uqg0IjP+GUtKvJ7qWY0myNuCfR5otmgV6XLKah7cKLJ4A/v8/V8UuOiyPfNewXWbvnXYqvzsOmDUl5QlHIN7fqlVLPdbx3GLzikP21hHzG7HZXnHXj07qXa01bM9VOLgTzaLvkn/aj85RopfE38qItxMBy7MBm5cIF5drJhz+5Q== linhnguyen.workspace@gmail.com"
}

module "volume" {
  source      = "../../modules/volume"
  server_name = local.server_name
  size        = 10
  mount_path  = "/opt/dir_a"
  location    = local.location
}

module "instance" {
  source      = "../.."
  name        = local.server_name
  image       = "rocky-9"
  location    = local.location
  server_type = "cx21"
  ssh_keys    = [hcloud_ssh_key.default.id]
  user_data   = <<EOF
#cloud-config
package_update: true
packages:
  - git
  - tar
  - vim
runcmd:
  - "mkfs.ext4 ${module.volume.linux_device}"
  - "mkdir ${module.volume.mount_path}"
  - "mount -o discard,defaults ${module.volume.linux_device} ${module.volume.mount_path}"
  - "echo '${module.volume.linux_device} ${module.volume.mount_path} ext4 discard,nofail,defaults 0 0' >> /etc/fstab"
EOF
  network_config = {
    subnet_id = hcloud_network_subnet.foonet.id
  }
  public_net = {
    ipv4_enabled = true
  }
  attach_volumes = [module.volume.id]

  labels = {
    terraform  = true
    allow_icmp = true
  }
}
