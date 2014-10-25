ansible-mesos
=============

## Requirements
  
  - ansible-zookeeper, or a zookeeper server

## Overview

The ansible-mesos role supports the installation and configuration of a mesos cluster with roles for master, slave or a master-slave configuration. 

It optionally supports the installation of docker with slave containerizers configured for both docker and native mesos execution. 

## Configuration

Combined with [Ansible groups](http://docs.ansible.com/intro_inventory.html#hosts-and-groups) this role makes it easy to specify a multi-node Mesos master for high availability. There is one variable in your playbook to override:

* ```zookeeper_hostnames``` specifies the list of zookeeper nodes used by Mesos for HA. By default this is the current node hostname and the default zookeeper port ```localhost:2181```. It can be constructed in your playbook by combining all nodes in your zookeeper group:

     - { role: 'ansible-mesos', zookeeper_hostnames: "{{ groups.zookeeper_hosts | join(':' + zookeeper_client_port + ',')  }}:{{ zookeeper_client_port  }}" }

which produces ```zookeeper1:2181,zookeeper2:2181,zookeeper3:2181```. This gets merged into the mesos_zookeeper_masters uri. 
 
You may also want to specify a ```mesos_quorum``` value of ```n/2 + 1```, where n is the number of nodes, as Mesos uses a ```replicated_log``` by default.

See the ```vars/main.yml``` file for specific role settings and [the Mesos configuration page for Mesos settings](http://mesos.apache.org/documentation/latest/configuration/).
