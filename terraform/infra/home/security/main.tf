provider "libvirt" {
  uri = "${var.kvm_destination_uri}"
}

module "vault" {
  source            = "../../../modules/kvm/bridged"
  hostname          = "vault"
  memory            = "1024"
  volume_name       = "vault_volume"
  image_source_path = "${var.os_image_path}"
}

module "keycloak" {
  source            = "../../../modules/kvm/bridged"
  hostname          = "keycloak"
  memory            = "1024"
  volume_name       = "keycloak_volume"
  image_source_path = "${var.os_image_path}"
}