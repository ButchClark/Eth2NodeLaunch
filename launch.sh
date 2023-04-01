#!/bin/bash
# Set up the environment variables for mount points
export EXECUTIONDIR=~/data/geth
export CONSENSUSDIR=~/data/prysm
export PROMETHEUSDIR=~/prometheus
export GRAFANADIR=~/grafana

# Create the directories if they don't exist
mkdir -p $EXECUTIONDIR
mkdir -p $CONSENSUSDIR
mkdir -p $PROMETHEUSDIR
mkdir -p $GRAFANADIR/etc/grafana

# If we don't already have a JWT file, create one
if [ ! -f $EXECUTIONDIR/jwt.hex ]
then
	echo "creating new jtw.hex file"
	openssl rand -hex 32 | tr -d "\n" > "$EXECUTIONDIR"/jwt.hex
else
	echo "using existing jwt.hex file"
fi

# Create network for nodes to communicate on
docker network create nodes

# Kick it
docker-compose up -d
