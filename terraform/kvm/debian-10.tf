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

provider "libvirt" {
  uri = var.kvm_destination_uri
}

resource "libvirt_volume" "os_image" {
  name   = "os_image"
  pool   = "default"
  source = var.image_source_path
}

resource "libvirt_domain" "debian_10" {
  name = "debian_10"

  disk {
    volume_id = "${libvirt_volume.os_image.id}"
  }

  network_interface {
    hostname  = var.hostname
    bridge    = "br0"
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
