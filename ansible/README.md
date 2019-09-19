## README

This README shows the ansible playbooks information located in this
repository.

### NFS

This playbook is capable of setting both a NFS server and a NFS
client.

#### Setting server

```shell
ansible-playbook -i ~/.ansible/hosts -e "nfs_role=server nfs_allowed_netmask=192.168.1.0/24" nfs.yml
```

Variables
---------

- nfs_role=server
- nfs_allowed_netmask=192.168.1.0/24

#### Setting client

```shell
ansible-playbook -i ~/.ansible/hosts -e "nfs_role=client" nfs.yml
```

Variables
---------

- nfs_role=client

### UFW

This playbook can install the firewall UFW and allowes SSH connections
to the server.

```shell
ansible-playbook -i ~/.ansible/hosts ufw
```

### USR

This playbook creates a given sudo user in all hosts
