ansible-mesos - Ansible Playbook for Mesos
=============

[![Build Status](https://travis-ci.org/AnsibleShipyard/ansible-mesos.svg?branch=master)](https://travis-ci.org/AnsibleShipyard/ansible-mesos)

The ansible-mesos role supports the installation and configuration of a mesos cluster with options for master, slave or a master-slave setup. It supports Ubuntu and RedHat/Centos.

It also allows the setting of specific slave executors so you can run with native docker support.

Installation
-----------

```bash
ansible-galaxy install JasonGiedymin.mesos
```

Dependencies
------------

Java and Zookeeper

 - https://github.com/geerlingguy/ansible-role-java OR https://github.com/AnsibleShipyard/ansible-java
 - https://github.com/AnsibleShipyard/ansible-zookeeper

Requirements
------------

Ansible version at least 1.7

Role Variables
--------------

```yaml
---
mesos_install_mode: "master" # {master|slave|master-slave}
mesos_version: "1.0.1"

# Debian
mesos_package_version: "2.0.93"
mesosphere_apt_url: "http://repos.mesosphere.com/{{ ansible_distribution | lower }}"
mesos_os_distribution: "{{ ansible_distribution | lower }}"
mesos_os_version: "{{ ansible_distribution_version.split('.') | join('') }}"
mesos_apt_package: "mesos={{ mesos_version }}-{{ mesos_package_version }}.{{ mesos_os_distribution }}{{ mesos_os_version }}"

# RedHat: EPEL and Mesosphere yum repositories URL
epel_repo: "https://dl.fedoraproject.org/pub/epel/{{ os_version_major }}/{{ ansible_architecture }}/{{ epel_releases[os_version_major] }}"
mesosphere_yum_repo: "https://repos.mesosphere.com/el/{{ os_version_major }}/noarch/RPMS/{{ mesosphere_releases[os_version_major] }}"

# conf file settings
mesos_cluster_name: "mesos_cluster"
mesos_ip: "{{ ansible_default_ipv4.address }}"
mesos_hostname: "{{ ansible_hostname }}"
mesos_master_port: "5050"
mesos_slave_port: "5051"
mesos_log_location: "/var/log/mesos"
mesos_ulimit: "-n 8192"
mesos_work_dir: "/var/mesos"
mesos_quorum: "1"
zookeeper_client_port: "2181"
zookeeper_hostnames: "{{ mesos_hostname }}:{{ zookeeper_client_port }}"
mesos_zookeeper_masters: "zk://{{ zookeeper_hostnames }}/mesos"
mesos_owner: root
mesos_group: root

# Containerizer
mesos_containerizers: "docker,mesos"
mesos_executor_timeout: "5mins"

mesos_option_prefix: "MESOS_"

# Additional configurations
mesos_additional_configs: []
  # For example:
  # - name: FOO
  #   value: bar

# Additional configurations for master
mesos_master_additional_configs: []
  # For example:
  # - name: FOO
  #   value: bar

# Additional configurations for slave
mesos_slave_additional_configs: []
  # For example:
  # - name: FOO
  #   value: bar
```

Playbook Example
----------------

```yaml
- name: Java + Zookeeper + Mesos [master-slave]
  hosts: all
  sudo: yes
  roles:
    - role: geerlingguy.java

    - role: AnsibleShipyard.ansible-zookeeper

    - role: ansible-mesos
      mesos_install_mode: master-slave
```

Docker is only required on slave nodes and is not installed by default.
To use docker with Mesos ensure that docker is installed on slave nodes.
You can then set ```mesos_containerizers: "docker,mesos"``` for slave nodes.

License
-------

Apache License

AnsibleShipyard
-------

Our related playbooks

1. [ansible-marathon](https://github.com/AnsibleShipyard/ansible-marathon)
1. [ansible-chronos](https://github.com/AnsibleShipyard/ansible-chronos)
1. [ansible-zookeeper](https://github.com/AnsibleShipyard/ansible-zookeeper)

Author Information
------------------

@AnsibleShipyard/developers and others.
