server = true
bootstrap_expect = 2
retry_join = {{ (groups['consul_leader'] + groups['consul_followers']) | to_json }}
