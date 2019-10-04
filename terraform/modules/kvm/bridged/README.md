# VM using KVM

This directory creates different VMs on a KVM environment using
[Terraform](https://www.terraform.io) and the [KVM Terraform
provider](https://github.com/dmacvicar/terraform-provider-libvirt)

## Modules

Instead of autonomous separated Terraform files, I've gone one
step forward and I've organized everything around modules. The
description of the machines I'm creating are in the `infra`
directories while the details about every resource for each
machine can be found in `modules` directories.

At the beginning is confusing to understand that a Terraform 
module is in reality the machine you're creating while the stuff 
you're putting in the `modules` directory is instead
the details you're reusing for different machines:

```ruby
module "vault" {
    source "../../modules/simple"
}

module "keycloak" {
    source "../../modules/simple"
}
```

More about modules:

- [Terraform modules](https://www.terraform.io/docs/modules/index.html)
- Linode [tutorial about modules](https://www.linode.com/docs/applications/configuration-management/create-terraform-module/). 
Highly recommended.

## Vars

Because is better to avoid harcoding most of the parameters in the
`tf` file in order to keep it reusable, the best option is to create
a `tfvars` file an put the values there.

I'm not versioning the `tfvars` file in this repository but I've left
a template as an example.

More about vars:

- [Terraform tutorial](https://learn.hashicorp.com/terraform/getting-started/variables.html) about input variables

## Build resources

```
terraform apply -var-file="bridged.tfvars"
```

References:

- [Terraform apply command](https://www.terraform.io/docs/commands/apply.html)

## Destroy resources

```
terraform destroy -var-file="bridged.tfvars"
```

References:

- [Terraform destroy command](https://www.terraform.io/docs/commands/destroy.html)