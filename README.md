ansible-mesos
=============

Mesos Playbook for Ansible

Support open source!

NOTE: This role requires the following roles:
  - ansible-java
  - ansible-scala
  - ansible-sbt

I've supplied these to galaxy and you should be able to pull them or clone them
directly from github. I'm not a fan of specifying a dependency without a
version, thus I've removed them from `meta/main.yml`.

## How to use this playbook?

See this sample [playbook](https://github.com/AnsibleShipyard/ansible-galaxy-roles/blob/master/playbook.yml)
which shows how to use this playbook as well as others. It is part of [ansible-galaxy-roles](https://github.com/AnsibleShipyard/ansible-galaxy-roles) and
serves as a curation (and thus an example) of all our ansible playbooks.

## Our Other Mesos related playbooks

1. [ansible-mesos](https://github.com/AnsibleShipyard/ansible-mesos)
1. [ansible-marathon](https://github.com/AnsibleShipyard/ansible-marathon)
1. [ansible-chronos](https://github.com/AnsibleShipyard/ansible-chronos)
1. [ansible-mesos-docker](https://github.com/AnsibleShipyard/ansible-mesos-docker)
