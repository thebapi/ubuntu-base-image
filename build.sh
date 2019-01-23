#!/usr/bin/env bash

docker image build --sysctl net.core.somaxconn=65535 --compress --network host -t sajib-ubuntu .