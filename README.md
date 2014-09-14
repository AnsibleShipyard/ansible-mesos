ansible-mesos
=============

Mesos Playbook for Ansible, with multi-master zookeeper support and both docker and native mesos executors configured.  Install this on Ubuntu 14.04 LTS. [Read the blog post](http://blog.michaelhamrah.com/2014/06/setting-up-a-multi-node-mesos-cluster-running-docker-haproxy-and-marathon-with-ansible/) for a descriptive overview.

NOTE: This role requires the following roles:

  - ansible-java, or java already installed on the host.

## Overview

- Installs Docker
- Relies on mesos_masters group to configure zookeeper, masters
- Supports master, slave, and master-slave options
- Installs Zookeeper on master
- mesos_masters group determines zookeeper and master configuration
- Puts configuration in /etc/default/mesos, /etc/default/mesos-master and /etc/default/mesos-slave
- Removes the mesosphere /etc/mesos, /etc/mesos-master and /etc/mesos-slave configuration files.

See [mhamrah/ansible-mesos-playbook](https://github.com/mhamrah/ansible-mesos-playbook) for an example playbook which sets up a multi-node mesos cluster. The example also includes [Ansible-Marathon](https://github.com/mhamrah/ansible-marathon) for running applications on Mesos.
