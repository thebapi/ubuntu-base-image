#!/usr/bin/env bash
set -e
source /pd_build/buildconfig

header "Installing Python..."

## Install Python.
minimal_apt_get_install python python2.7 python3