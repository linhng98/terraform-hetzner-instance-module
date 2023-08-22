output "id" {
  value       = module.instance.id
  description = "Unique ID of the server."
}

output "name" {
  value       = module.instance.name
  description = "Name of the server."
}

output "network" {
  value       = module.instance.network
  description = "Server network."
}

output "server_type" {
  value       = module.instance.server_type
  description = "Name of the server type."
}

output "image" {
  value       = module.instance.image
  description = "Name or ID of the image the server was created from."
}

output "location" {
  value       = module.instance.location
  description = "The location name."
}

output "labels" {
  value       = module.instance.labels
  description = "Resource labels."
}
