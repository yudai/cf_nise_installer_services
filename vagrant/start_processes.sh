#!/bin/sh -ex

(
    cd cf-services-contrib-release
    vagrant ssh -c "`cat ../common/start_processes.sh`"
)
