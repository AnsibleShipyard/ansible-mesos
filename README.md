ansible-mesos
=============

Mesos Playbook for Ansible, with multi-master zookeeper support and [Deimos](https://github.com/mesosphere/deimos) installed for running docker containers. Install this on Ubuntu 14.04 LTS. [Read the blog post](http://blog.michaelhamrah.com/2014/06/setting-up-a-multi-node-mesos-cluster-running-docker-haproxy-and-marathon-with-ansible/) for a descriptive overview.

NOTE: This role requires the following roles:

  - ansible-java

See [mhamrah/ansible-mesos-playbook](https://github.com/mhamrah/ansible-mesos-playbook) for an example playbook which sets up a multi-node mesos cluster. The example also includes [Ansible-Marathon](https://github.com/mhamrah/ansible-marathon) for running applications on Mesos.
