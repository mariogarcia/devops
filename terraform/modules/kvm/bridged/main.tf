resource "libvirt_volume" "os_image" {
  name   = "${var.volume_name}"
  pool   = "default"
  source = "${var.image_source_path}"
}

resource "libvirt_domain" "new_vm" {
  name   = "${var.name}"
  memory = "${var.memory}"
  vcpu   = "${var.cpu_count}"

  disk {
    volume_id = "${libvirt_volume.os_image.id}"
  }

  network_interface {
    bridge         = "${var.bridge}"
  }
}