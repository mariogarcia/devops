
# 0) PROVIDER
provider "libvirt" {
  uri = "${var.kvm_destination_uri}"
}

# 1) DOCKER
module "docker" {
  name              = "docker"
  source            = "../../../modules/kvm/bridged"
  bridge            = "${var.bridge}"
  memory            = "4096"
  image_source_path = "${var.os_image_path}"
  volume_name       = "docker_volume"
}
