#!/usr/bin/env bash

set -e

/etc/init.d/networking restart
ifup {{ device_name }}
