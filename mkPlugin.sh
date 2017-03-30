#!/bin/bash
TMPDIR=/tmp/docker-volume-netshare
rm -rf $TMPDIR
docker plugin rm wanghaibo/docker-volume-netshare
docker build -t netshare .
id=$(docker create netshare true) # id was cd851ce43a403 when the image was created
mkdir -p $TMPDIR/rootfs
cp ./config.json $TMPDIR/
docker export "$id" | sudo tar -x -C $TMPDIR/rootfs
docker rm -vf "$id"
docker rmi netshare 
docker plugin create wanghaibo/docker-volume-netshare $TMPDIR
