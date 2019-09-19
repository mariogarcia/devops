variable "name" {
  type        = "string"
  description = "name of the vm"
}

variable "memory" {
  type        = "string"
  description = "amount of memory"
  default     = "2048"
}

variable "cpu_count" {
  type        = "string"
  description = "number of cpus used by vm"
  default     = "2"
}

variable "bridge" {
  type = "string"
}

variable "volume_name" {
  type = "string"
}

variable "image_source_path" {
  type        = "string"
  description = "qcow2 image path"
}



