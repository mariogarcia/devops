output "nomad_1_ip" {
  value = "${module.nomad_1.ipv4}"
}
output "nomad_2_ip" {
  value = "${module.nomad_2.ipv4}"
}

output "consul_1_ip" {
  value = "${module.consul_1.ipv4}"
}

output "consul_2_ip" {
  value = "${module.consul_2.ipv4}"
}
