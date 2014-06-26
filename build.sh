#!/bin/bash

DOCKERNAME="ansibleshipyard/ansible-mesos"

time docker build -t $DOCKERNAME .

echo
echo "This image is a trusted docker.io Image."
echo
echo "To pull it"
echo "    docker pull $DOCKERNAME"
echo
echo "To use this docker:"
echo "    docker run -d -P $DOCKERNAME"
echo
echo "To run in interactive mode for debug:"
echo "    docker run -t -i $DOCKERNAME bash"
echo
