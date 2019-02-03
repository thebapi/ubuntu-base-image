#!/usr/bin/env bash
set -e
source /pd_build/buildconfig

run /pd_build/utilities.sh
run /pd_build/python.sh
run /pd_build/golang.sh



# Must be installed after Ruby, so that we don't end up with two Ruby versions.
run /pd_build/nginx-passenger.sh

run /pd_build/finalize.sh