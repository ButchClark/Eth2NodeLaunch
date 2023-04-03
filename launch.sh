#!/bin/bash
# Set up the environment variables for mount points
export EXECUTIONDIR=~/data/geth
export CONSENSUSDIR=~/data/prysm
export PROMETHEUSDIR=~/prometheus
export GRAFANADASH=~/grafana/dashboards
export GRAFANAPROV=~/grafana/provisioning

# Create the directories if they don't exist
mkdir -p $EXECUTIONDIR
mkdir -p $CONSENSUSDIR
mkdir -p $PROMETHEUSDIR
mkdir -p $GRAFANADASH
mkdir -p $GRAFANAPROV/dashboards
mkdir -p $GRAFANAPROV/datasources

# Copy any JSON files containing "dash" to the grafana dashboard dir
cp ./grafana/*dash*.json $GRAFANADASH
cp ./grafana/local.yml $GRAFANAPROV/dashboards
cp ./grafana/datasource.yml $GRAFANAPROV/datasources

# If we don't already have a JWT file, create one
if [ ! -f $EXECUTIONDIR/jwt.hex ]
then
	echo "creating new jtw.hex file"
	openssl rand -hex 32 | tr -d "\n" > "$EXECUTIONDIR"/jwt.hex
else
	echo "using existing jwt.hex file"
fi

# Create network for nodes to communicate on
docker network create --attachable nodes

# Kick it
docker-compose up -d
