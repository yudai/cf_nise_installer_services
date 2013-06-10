#!/bin/bash -ex

INSTALLER_REPO=${INSTALLER_REPO:-https://raw.github.com/yudai/cf_nise_installer}
INSTALLER_BRANCH=${INSTALLER_BRANCH:-master}

mkdir -p scripts
mkdir -p manifests

installer_url=${INSTALLER_REPO}/${INSTALLER_BRANCH}
for file in vagrant_install.sh clone_cf_release.sh launch_vagrant.sh postinstall.sh start_processes.sh register_service_tokens.sh; do
    wget ${installer_url}/scripts/${file} -O scripts/${file}
    chmod u+x scripts/${file}
done

wget ${installer_url}/manifests/micro.yml -O manifests/micro.yml

./scripts/vagrant_install.sh