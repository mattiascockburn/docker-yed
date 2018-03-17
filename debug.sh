#!/bin/bash
set -u

IMAGE='yed:latest'
HOME=$(pwd)
XSOCK=/tmp/.X11-unix
XAUTH=$(mktemp /tmp/.docker.xauth-XXXXX)
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run \
  -t \
  -i \
  --memory 2gb \
  --cpuset-cpus 0 \
  --rm \
  -v /etc/localtime:/etc/localtime:ro \
  -v $XSOCK:$XSOCK \
  -v $XAUTH:$XAUTH \
  -v $HOME:/work \
  -e DISPLAY=unix$DISPLAY \
  -e XAUTHORITY=$XAUTH \
  --entrypoint /bin/sh \
  --user root \
  "$IMAGE" "$@"

rm $XAUTH

#  --net host \
  # http://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container
#docker run -ti -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH xeyes

