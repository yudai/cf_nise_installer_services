# Services Addon for Cloud Foundry v2 Nise Installer 

## Services Installer with Nise BOSH and nise-bosh-vagrant

This addon in an installer for Cloud Foundry build-in services on a single server or a Vagrant VM. Servicee nodes build with this installer work with a devbox created with cf_nise_installer.

This installer is still ALPHA version.


## Building Service Node on Single Server


### Requirements

* Ubuntu 10.04 64bit
   * *Ubuntu 12.04 is not supported*
* 8GB+ free HDD space
* 4GB+ memory
   * m1.medium or larger instance is recommended on AWS

#### * NOTICE *

You cannot install services on the same server on which Cloud Foundry componens installed by cf_nise_installer are running. You need another server to deploy services with this installer.

### Installing 

Run the commands below on your server:

```sh
sudo apt-get install curl
bash < <(curl -s -k -B https://raw.github.com/yudai/cf_nise_installer_services/${INSTALLER_BRANCH:-master}/local/bootstrap.sh)
```

The `bootstrap.sh` script installs everything needed for your services node. This command may take a couple of hours at first run.

You need to restart your server once after the installation is completed.

### Launching Processes

You can start the processes for your services node by running the following command in the `cf_nise_installer_services` directory cloned by the `bootstrap.sh` script:

```sh
./local/start_processes.sh
```

This command launches the Monit process and then start up all monit jobs installed by Nise BOSH.

You can also manually manage the processes with the Monit command:

```sh
# Start Monit
sudo /var/vcap/bosh/bin/monit
# Launch `all` processes
sudo /var/vcap/bosh/bin/monit start all
# See status
sudo /var/vcap/bosh/bin/monit status
sudo /var/vcap/bosh/bin/monit summary # shorter
# Stop `all` processes
sudo /var/vcap/bosh/bin/monit stop all
```

Confirm all the processes shown by `monit summary` indicate `running`. It takes a few minutes to initialize all processes.

## Build Service Node with Vagrant

You can create a services node VM quickly with Vagrant and [nise-bosh-vagrant](https://github.com/BrianMMcClain/nise-bosh-vagrant).

#### Requirements

* Vagrant 1.2 or later
* Ruby 1.9.3-p448 (Required by cf-release)
* 8GB+ free HDD space
* 4GB+ free memory

### Launch Vagrant VM with CF components

Run the following command:

```sh
sudo apt-get install curl
bash < <(curl -s -k -B https://raw.github.com/yudai/cf_nise_installer_services/${INSTALLER_BRANCH:-master}/vagrant/bootstrap.sh)
```
Once the command is finished, you can target your devbox and push applications.

