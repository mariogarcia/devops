module "k8s_master" {
  source = "../machine"

  image_source_path   = pathexpand("~/Development/devops/hashicorp-tools/packer/out/packer-buster")
  hostname            = "k8s_master"
  memory              = "2048"
  cpu_count           = "2"
  bridge_name         = "br0"
  os_image            = "master_volume"
}