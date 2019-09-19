output "vault_ip" {
  value = "${module.vault.ipv4}"
}

output "keycloak_ip" {
  value = "${module.keycloak.ipv4}"
}
