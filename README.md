ansible-mesos - Ansible Playbook for Mesos
=============

[![Build Status](https://travis-ci.org/AnsibleShipyard/ansible-mesos.svg?branch=master)](https://travis-ci.org/AnsibleShipyard/ansible-mesos)

## Overview

The ansible-mesos role supports the installation and configuration of a mesos cluster with options for master, slave or a master-slave setup. It supports Ubuntu and RedHat/Centos. 

It also allows the setting of specific slave executors so you can run with native docker support.

## Requirements
  
  - ansible-zookeeper, or a zookeeper server

## Configuration

Combined with [Ansible groups](http://docs.ansible.com/intro_inventory.html#hosts-and-groups) this role makes it easy to specify a multi-node Mesos master for high availability. There is one variable in your playbook to override:

* ```zookeeper_hostnames``` specifies the list of zookeeper nodes used by Mesos for HA. By default this is the current node hostname and the default zookeeper port ```localhost:2181```. It can be constructed in your playbook by combining all nodes in your zookeeper group:

  ``` yaml
  - { role: 'ansible-mesos', zookeeper_hostnames: "{{ groups.zookeeper_hosts | join(':' + zookeeper_client_port + ',')  }}:{{ zookeeper_client_port  }}" }
  ```

which produces ```zookeeper1:2181,zookeeper2:2181,zookeeper3:2181```. This gets merged into the mesos_zookeeper_masters uri. 
 
You may also want to specify a ```mesos_quorum``` value of ```n/2 + 1```, where n is the number of nodes, as Mesos uses a ```replicated_log``` by default.

### Docker Support

Docker is only required on slave nodes and is not installed by default. To use docker with Mesos ensure that docker is installed on slave nodes. You can then set ```mesos_containerizers: "docker,mesos"``` for slave nodes.

See the ```vars/main.yml``` file for specific role settings and [the Mesos configuration page for Mesos settings](http://mesos.apache.org/documentation/latest/configuration/).
