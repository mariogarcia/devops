
# 0) PROVIDER
provider "libvirt" {
  uri = "${var.kvm_destination_uri}"
}

# 1) NOMAD RESOURCES (2x)
module "nomad_1" {
  name              = "nomadn1"
  source            = "../../../modules/kvm/bridged"
  bridge            = "${var.bridge}"
  memory            = "2048"
  image_source_path = "${var.os_image_path}"
  volume_name       = "nomad_disk_1"
}

module "nomad_2" {
  name              = "nomadn2"
  source            = "../../../modules/kvm/bridged"
  bridge            = "${var.bridge}"
  memory            = "2048"
  image_source_path = "${var.os_image_path}"
  volume_name       = "nomad_disk_2"
}

# 2) CONSUL RESOURCES (2x)
module "consul_1" {
  name              = "consuln1"
  source            = "../../../modules/kvm/bridged"
  bridge            = "${var.bridge}"
  memory            = "1024"
  image_source_path = "${var.os_image_path}"
  volume_name       = "consul_disk_1"
}

module "consul_2" {
  name              = "consuln2"
  source            = "../../../modules/kvm/bridged"
  bridge            = "${var.bridge}"
  memory            = "1024"
  image_source_path = "${var.os_image_path}"
  volume_name       = "consul_disk_2"
}