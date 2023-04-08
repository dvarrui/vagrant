# Create SNode Teuton docker container
# Using volumen for persistet data

# IMAGE=dvarrui/snode
IMAGE="opensuse/tumbleweed"
NAME=snode
docker run -it --rm --name $NAME -v "$PWD":/opt -w /opt $IMAGE /bin/bash

