output "ipv4" {
  value = "${libvirt_domain.new_vm.network_interface.0.addresses[0]}"
}