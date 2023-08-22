variable "name" {
  description = "Name of the server to create (must be unique per project and a valid hostname as per RFC 1123)."
  type        = string
}

variable "server_type" {
  description = "Name of the server type this server should be created with."
  type        = string
}

variable "image" {
  description = "Name or ID of the image the server is created from."
  type        = string
}

variable "location" {
  description = "The location name to create the server in. nbg1, fsn1, hel1, ash or hil."
  type        = string
}

variable "datacenter" {
  description = "The datacenter name to create the server in. nbg1-dc3, fsn1-dc14, hel1-dc2, ash-dc1 or hil-dc1."
  type        = string
  default     = null
}

variable "user_data" {
  description = "Cloud-Init user data to use during server creation."
  type        = string
  default     = null
}

variable "ssh_keys" {
  description = "SSH key IDs or names which should be injected into the server at creation time."
  type        = list(string)
  default     = []
}

variable "public_net" {
  description = "In this block you can either enable / disable ipv4 and ipv6 or link existing primary IPs (checkout the examples). If this block is not defined, two primary (ipv4 & ipv6) ips getting auto generated."
  type = object({
    ipv4_enabled = optional(bool, false)
    ipv4         = optional(string)
    ipv6_enabled = optional(bool, false)
  })
}

variable "keep_disk" {
  description = "If true, do not upgrade the disk. This allows downgrading the server type later."
  type        = bool
  default     = true
}


variable "iso" {
  description = "ID or Name of an ISO image to mount."
  type        = string
  default     = null
}

variable "rescue" {
  description = "Enable and boot in to the specified rescue system. This enables simple installation of custom operating systems. linux64 or linux32"
  type        = string
  default     = null
}

variable "backups" {
  description = "Enable or disable backups."
  type        = bool
  default     = false
}

variable "firewall_ids" {
  description = "Firewall IDs the server should be attached to on creation."
  type        = list(string)
  default     = []
}

variable "network_config" {
  description = "Network the server should be attached to on creation."
  type = object({
    subnet_id = string
    ip        = optional(string)
    alias_ips = optional(list(string), [])
  })
}

variable "placement_group_id" {
  description = "Placement Group ID the server added to on creation."
  type        = string
  default     = null
}

variable "attach_volumes" {
  description = "List volume id to attach with."
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(string)
  default     = {}
}
