#!/usr/bin/env bash

set -e

KUBE_CONFIG_DIR=/home/kubi/.kube
KUBE_CONFIG_FILE=$KUBE_CONFIG_DIR/config

# make kubectl configuration available to kubi user
echo "KUBECTL configuration"
mkdir -p $KUBE_CONFIG_DIR
cp -i /etc/kubernetes/admin.conf $KUBE_CONFIG_FILE
chown -R kubi:kubi $KUBE_CONFIG_DIR

# apply calico network (for kubernetes v1.14.x)
echo "KUBECTL installing FLANNEL"
kubectl --kubeconfig $KUBE_CONFIG_FILE apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
