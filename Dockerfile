#
# ansibleshipyard/ansible-mesos
#   docker build -t ansibleshipyard/ansible-mesos .
#
# Requires:
# ansibleshipyard/ansible-mesos
#   https://github.com/AnsibleShipyard/ansible-base-ubuntu
#

FROM jasongiedymin/ansible-base-ubuntu
MAINTAINER AnsibleShipyard

# Working dir
ENV WORKDIR /tmp/build/ansible-mesos

# Entrypoint
#ENTRYPOINT /tmp/build/ansible-mesos

# Create roles directory
CMD mkdir /etc/ansible/roles

# Install git
CMD apt-get -y update
CMD apt-get -y install git

# ADD
ADD meta $WORKDIR/meta
ADD tasks $WORKDIR/tasks
ADD tests $WORKDIR/tests
ADD vars $WORKDIR/vars

# Here we continue to use add because
# there are a limited number of RUNs
# allowed.
ADD tests/inventory /etc/ansible/hosts
ADD tests/playbook.yml $WORKDIR/playbook.yml

# Install roles
CMD git clone git://github.com/AnsibleShipyard/ansible-java /etc/ansible/roles/java
CMD git clone git://github.com/AnsibleShipyard/ansible-sbt /etc/ansible/roles/sbt
CMD git clone git://github.com/AnsibleShipyard/ansible-scala /etc/ansible/roles/scala

# Execute
RUN ansible-playbook $WORKDIR/playbook.yml -c local
