ansible-mesos
=============

Mesos Playbook for Ansible, with multi-master zookeeper support and both docker and native mesos executors configured.  Install this on Ubuntu 14.04 LTS. [Read the blog post](http://blog.michaelhamrah.com/2014/06/setting-up-a-multi-node-mesos-cluster-running-docker-haproxy-and-marathon-with-ansible/) for a descriptive overview.

NOTE: This role requires the following roles:

  - ansible-java, or java already installed on the host.

## Overview

- Installs Docker
- Relies on mesos_masters group to configure zookeeper, masters for HA
- Supports master, slave, and master-slave installations per node
- Configures slave containerizers as docker,mesos for docker and native mesos support
- Puts configuration in /etc/default/mesos, /etc/default/mesos-master and /etc/default/mesos-slave
- Removes the default mesosphere /etc/mesos, /etc/mesos-master and /etc/mesos-slave configuration files (favors environment variables, /etc/defaults)
- Uses upstart to launch /usr/bin/mesos-init-wrapper

See [mhamrah/ansible-mesos-playbook](https://github.com/mhamrah/ansible-mesos-playbook) for an example playbook which sets up a multi-node mesos cluster. The example also includes [Ansible-Marathon](https://github.com/mhamrah/ansible-marathon) for running applications on Mesos.

## Notes

Currently supports Mesos 0.20. Note that mesos 0.20 only supports docker in --net=host mode.
