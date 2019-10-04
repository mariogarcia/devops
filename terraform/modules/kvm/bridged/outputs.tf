output "ipv4" {
  value = "${libvirt_domain.new_vm.network_interface}"
}