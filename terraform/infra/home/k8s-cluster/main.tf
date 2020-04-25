
# 0) PROVIDER
provider "libvirt" {
  uri = "${var.kvm_destination_uri}"
}

# 1) K8S RESOURCES (2x)
module "k8s_1" {
  name              = "k8sn1"
  source            = "../../../modules/kvm/bridged"
  bridge            = "${var.bridge}"
  memory            = "2048"
  image_source_path = "${var.os_image_path}"
  volume_name       = "k8s_disk_1"
}

module "k8s_2" {
  name              = "k8sn2"
  source            = "../../../modules/kvm/bridged"
  bridge            = "${var.bridge}"
  memory            = "2048"
  image_source_path = "${var.os_image_path}"
  volume_name       = "k8s_disk_2"
}
