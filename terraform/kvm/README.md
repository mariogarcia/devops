# VM using host bridge network

This is an example of how to create a VM on a KVM environment using
[Terraform](https://www.terraform.io) and the [KVM Terraform
provider](https://github.com/dmacvicar/terraform-provider-libvirt)

## Terraform file

In this example the resources to create by Terraform are:

```ruby
resource "libvirt_volume" "os_image" {

}

resource "libvirt_domain" "new_vm" {

}
```

A volume containing the OS and the general information about the new
VM such as hostname, memory, and type of network to use. Because I'd
like the new VM to use an IP of the same net of the host machine I'm
telling the machine to use the host configured bridge interface.

## Vars

Because is better to avoid harcoding most of the parameters in the
`tf` file in order to keep it reusable, the best option is to create
a `tfvars` file an put the values there.

I'm not versioning the `tfvars` file in this repository but I've left
a template as an example.

## Build resources

```
terraform build -var-file="bridged.tfvars"
```

## Destroy resources

```
terraform destroy -var-file="bridged.tfvars"
```
