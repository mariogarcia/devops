variable "kvm_destination_uri" {
  type        = "string"
  description = "kvm instance uri where the vm is going to be deployed"
  default     = "qemu:///system"
}

variable "os_image_path" {
  type        = "string"
  description = "path to the qcow2 reference image"
}
