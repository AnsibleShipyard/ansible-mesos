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
RUN mkdir -p /etc/ansible/roles
RUN mkdir -p /usr/bin

# Install git
RUN apt-get -y update
RUN apt-get -y install git

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
RUN git clone git://github.com/AnsibleShipyard/ansible-java /etc/ansible/roles/java
RUN git clone git://github.com/AnsibleShipyard/ansible-sbt /etc/ansible/roles/sbt
RUN git clone git://github.com/AnsibleShipyard/ansible-scala /etc/ansible/roles/scala

# Execute
RUN ansible-playbook $WORKDIR/playbook.yml -c local
