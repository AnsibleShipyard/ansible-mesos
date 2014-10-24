ansible-mesos
=============

Mesos Playbook for Ansible, with multi-master zookeeper support and docker and native mesos executors configured.  Install this on Ubuntu 14.04 LTS or RHEL/Centos 6.5. RHEL/Centos 7 will fail with zookeeper issues. [Read the blog post](http://blog.michaelhamrah.com/2014/06/setting-up-a-multi-node-mesos-cluster-running-docker-haproxy-and-marathon-with-ansible/) for a descriptive overview of how this relates to running the [mhamrah/ansible-mesos-playbook](https://github.com/mhamrah/ansible-mesos-playbook).

NOTE: This role requires the following roles:

  - ansible-java, or java already installed on the host.

## Overview

- Installs Docker
- Works in conjuction with Ansible groups and group_vars to configure a multi-node cluster for masters and zookeeper.
- Supports master, slave, and master-slave installations per node
- Configures slave containerizers as docker,mesos for docker and native mesos support
- Puts configuration in /etc/default/mesos, /etc/default/mesos-master and /etc/default/mesos-slave as per [Mesos documentation](http://mesos.apache.org/documentation/latest/configuration/).
- Removes the default mesosphere /etc/mesos, /etc/mesos-master and /etc/mesos-slave configuration files (favors environment variables, /etc/defaults)
- Uses upstart to launch /usr/bin/mesos-init-wrapper

See [mhamrah/ansible-mesos-playbook](https://github.com/mhamrah/ansible-mesos-playbook) for an example playbook which sets up a multi-node mesos cluster. The example also includes [Ansible-Marathon](https://github.com/mhamrah/ansible-marathon) for running applications on Mesos.

## Notes

Currently defaults to Mesos 0.20.1.
