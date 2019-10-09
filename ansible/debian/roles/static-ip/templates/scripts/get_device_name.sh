#!/usr/bin/env bash

ip -br add | grep UP | awk '{ print $1}'
