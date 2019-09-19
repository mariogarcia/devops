resource "libvirt_volume" "os_image" {
  name   = "${var.volume_name}"
  pool   = "default"
  source = "${var.image_source_path}"
}