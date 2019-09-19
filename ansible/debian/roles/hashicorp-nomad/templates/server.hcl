server {
  enabled = true
  bootstrap_expect = 1
}

consul {
  address = "{{ consul_ip }}:{{ consul_port }}"
}
