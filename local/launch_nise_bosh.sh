#!/bin/bash -ex

# Set current ip to nats server
NISE_IP_ADDRESS=${NISE_IP_ADDRESS:-`ip addr | grep 'inet .*global' | cut -f 6 -d ' ' | cut -f1 -d '/' | head -n 1`}

NISE_IP_ADDRESS=${NISE_IP_ADDRESS} ./common/launch_nsie_bosh.sh

(
    cd nise_bosh
    bundle install
    # Old spec format
    sudo env PATH=$PATH bundle exec ./bin/nise-bosh -y ../cf-services-contrib-release ../manifests/deploy.yml micro
)
