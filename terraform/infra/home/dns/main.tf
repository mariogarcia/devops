
# 0) PROVIDER
provider "libvirt" {
  uri = "${var.kvm_destination_uri}"
}

# 1) DNSMASQ
module "dnsmasq" {
  name              = "dnsmasq"
  source            = "../../../modules/kvm/bridged"
  bridge            = "${var.bridge}"
  memory            = "512"
  image_source_path = "${var.os_image_path}"
  volume_name       = "dnsmasq_volume"
}