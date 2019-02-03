#!/usr/bin/env bash
set -e
source /pd_build/buildconfig

run /pd_build/utilities.sh
run /pd_build/python.sh
run /pd_build/golang.sh

run /pd_build/finalize.sh