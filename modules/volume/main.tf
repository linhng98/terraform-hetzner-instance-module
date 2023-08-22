resource "hcloud_volume" "disk" {
  name              = "${var.server_name}${replace(var.mount_path, "/", "-")}-${var.size}GB"
  location          = var.location
  size              = var.size
  automount         = false
  format            = var.format
  delete_protection = var.delete_protection
  labels            = var.labels
}
