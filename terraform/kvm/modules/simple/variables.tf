variable "kvm_destination_uri" {
  type        = string
  description = "kvm instance uri where the vm is going to be deployed"
  default     = "qemu:///system"
}

variable "hostname" {
  type        = string
  description = "hostname of the vm"
}

#variable "ip" {
#  type = string
#}

variable "memory" {
  type        = string
  description = "amount of memory"
  default     = "2048"
}

variable "cpu_count" {
  type        = string
  description = "number of cpus used by vm"
  default     = "2"
}

variable "os_image" {
  type        = string
  description = "name of the vm volume"
}

variable "image_source_path" {
  type        = string
  description = "qcow2 image path"
}
