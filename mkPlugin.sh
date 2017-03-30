#!/bin/bash
set -x
set -e
if [ ! "$1" ]
then
    echo "miss $1 for plugin name"
    exit
else
    PLUGIN_NAME=$1
fi

TMPDIR=/tmp/docker-volume-netshare
rm -rf $TMPDIR
docker build -t netshare .
id=$(docker create netshare true)
mkdir -p $TMPDIR/rootfs
cp ./config.json $TMPDIR/
docker export "$id" | sudo tar -x -C $TMPDIR/rootfs
docker rm -vf "$id"
docker rmi netshare 
docker plugin create $PLUGIN_NAME $TMPDIR
