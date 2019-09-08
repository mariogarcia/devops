module "k8s_node1" {
  source = "../../modules/machine"

  kvm_destination_uri = "qemu+ssh://maintainer@future/system"
  image_source_path   = pathexpand("~/Development/devops/hashicorp-tools/packer/out/packer-buster")
  hostname            = "k8s_node1"
  memory              = "2048"
  cpu_count           = "2"
  bridge_name         = "br0"
  os_image            = "node1_volume"
}
