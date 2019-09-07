variable "image_source_path" {
  type        = string
  description = "qcow2 image path"
}

variable "kvm_destination_uri" {
  type        = string
  description = "kvm instance uri where the vm is going to be deployed"
}

provider "libvirt" {
  uri = var.kvm_destination_uri
}

resource "libvirt_pool" "terraform" {
  name = "terraform"
  type = "dir"
  path = "/tmp/terraform"
}

resource "libvirt_volume" "os_image" {
  name   = "os_image"
  pool   = "${libvirt_pool.terraform.name}"
  source = var.image_source_path
}

resource "libvirt_domain" "debian10" {
  name = "debian10"

  disk {
    volume_id = "${libvirt_volume.os_image.id}"
  }

  network_interface {
    network_name = "default"
    hostname     = "master"
    #    mac = "AA:BB:CC:11:22:22"
    #    addresses = ["192.168.1.55/32"]
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
