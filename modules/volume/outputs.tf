output "id" {
  value       = hcloud_volume.disk.id
  description = "Unique ID of the volume."
}

output "name" {
  value       = hcloud_volume.disk.name
  description = "Name of the volume."
}

output "location" {
  value       = hcloud_volume.disk.location
  description = "The location name."
}

output "mount_path" {
  value       = var.mount_path
  description = "The absolute path which this volume will be mounted with."
}

output "size" {
  value       = hcloud_volume.disk.size
  description = "Size of the volume."
}

output "linux_device" {
  value       = hcloud_volume.disk.linux_device
  description = "Device path on the file system for the Volume."
}

output "labels" {
  value       = hcloud_volume.disk.labels
  description = "Resource labels."
}
