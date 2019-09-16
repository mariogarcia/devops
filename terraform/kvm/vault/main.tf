module "vault" {
  source = "../simple"

  image_source_path   = pathexpand("~/Development/devops/hashicorp-tools/packer/out/packer-buster")
  hostname            = "vault"
  memory              = "1024"
  bridge_name         = "br0"
  os_image            = "vault_volume"
}
