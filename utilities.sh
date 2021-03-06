#!/usr/bin/env bash

set -e
source /pd_build/buildconfig

run apt-get -y update && apt-get -y upgrade
## Many Ruby gems and NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install build-essential
## Bundler has to be able to pull dependencies from git.
run minimal_apt_get_install g++ \
  gcc \
  wget \
  git \
  sudo \
  libc6-dev \
  make