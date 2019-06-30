provider "libvirt" {
  uri   = "qemu+ssh://maintainer@jason.org/system"
}

resource "libvirt_pool" "debian9" {
  name = "debian9"
  type = "dir"
  path = "/tmp/terraform-provider-libvirt-pool-debian9"
}

resource "libvirt_volume" "os_image" {
  name   = "os_image"
  pool   = "${libvirt_pool.debian9.name}"
  source = "/home/mario/Development/repositories/hashicorp-tools/packer/output_debian9/debian9"
}

resource "libvirt_domain" "debian9" {
  name = "debian9"

  disk {
    volume_id = "${libvirt_volume.os_image.id}"
  }

  network_interface {
    network_name = "default"
    hostname = "master"
    mac = "AA:BB:CC:11:22:22"
    addresses = ["192.168.1.55/32"]
  }

  graphics {
    listen_type = "address"
  }

  console {
    type = "pty"
    target_port = "0"
    target_type = "virtio"
  }
}
