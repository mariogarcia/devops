variable "image_source_path" {
  type        = string
  description = "qcow2 image path"
}

variable "kvm_destination_uri" {
  type        = string
  description = "kvm instance uri where the vm is going to be deployed"
}

variable "hostname" {
  type        = string
  description = "hostname of the vm"
}

variable "memory" {
  type        = string
  description = "amount of memory"
}

variable "bridge_name" {
  type        = string
  description = "name of the bridge configured in the host"
}

variable "cpu_count" {
  type        = string
  description = "number of cpus used by vm"
}

provider "libvirt" {
  uri = var.kvm_destination_uri
}

resource "libvirt_volume" "os_image" {
  name   = "os_image"
  pool   = "default"
  source = var.image_source_path
}

resource "libvirt_domain" "new_vm" {
  name   = var.hostname
  memory = var.memory
  vcpu   = var.cpu_count

  disk {
    volume_id = "${libvirt_volume.os_image.id}"
  }

  network_interface {
    hostname = var.hostname
    bridge   = var.bridge_name
  }

  graphics {
    listen_type = "address"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "virtio"
  }
}
