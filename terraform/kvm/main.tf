module "vault" {
  source = "./modules/simple"

  image_source_path   = pathexpand("~/Development/devops/hashicorp-tools/packer/out/packer-buster")
  hostname            = "vault"
  memory              = "1024"
  os_image            = "vault_volume"
}

output "vault_ip" {
  value = module.vault.ipv4
}

