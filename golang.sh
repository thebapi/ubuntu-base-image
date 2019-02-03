#!/usr/bin/env bash
set -e
source /pd_build/buildconfig

header "Installing Golang..."

run mkdir -p /goroot && \
  curl https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1