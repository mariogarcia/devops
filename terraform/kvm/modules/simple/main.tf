provider "libvirt" {
  uri = var.kvm_destination_uri
}

resource "libvirt_network" "tf" {
   name = "tf"
   domain = "tf.local"
   addresses = ["192.168.1.50/28"]
 }

resource "libvirt_volume" "os_image" {
  name   = "os_image${var.os_image}"
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
    network_id = "${libvirt_network.tf.id}"
    wait_for_lease = true
  }
}