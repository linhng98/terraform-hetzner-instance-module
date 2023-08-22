variable "server_name" {
  description = "Name of the server will attach to this volume."
  type        = string
}

variable "mount_path" {
  description = "The absolute path which this volume will be mounted with."
  type        = string
}

variable "size" {
  description = "Size of the volume (in GB)."
  type        = number
}

variable "location" {
  description = "The location name of the volume to create, not allowed if server_id argument is passed."
  type        = string
}

variable "format" {
  description = "Format volume after creation. xfs or ext4."
  type        = string
  default     = "ext4"
}

variable "delete_protection" {
  description = "Enable or disable delete protection."
  type        = bool
  default     = false
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(string)
  default     = {}
}
