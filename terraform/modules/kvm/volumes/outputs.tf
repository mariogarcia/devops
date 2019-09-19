output "volume_id" {
  value = "${libvirt_volume.os_image.id}"
}
