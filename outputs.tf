output "id" {
  value       = hcloud_server.instance.id
  description = "Unique ID of the server."
}

output "name" {
  value       = hcloud_server.instance.name
  description = "Name of the server."
}

output "network" {
  value       = hcloud_server.instance.network
  description = "Server network."
}

output "server_type" {
  value       = hcloud_server.instance.server_type
  description = "Name of the server type."
}

output "image" {
  value       = hcloud_server.instance.image
  description = "Name or ID of the image the server was created from."
}

output "location" {
  value       = hcloud_server.instance.location
  description = "The location name."
}

output "labels" {
  value       = hcloud_server.instance.labels
  description = "Resource labels."
}
