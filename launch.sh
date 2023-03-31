#!/bin/bash

export EXECUTIONDIR=~/data/geth
export CONSENSUSDIR=~/data/prysm
mkdir -p $EXECUTIONDIR
mkdir -p $CONSENSUSDIR

if [ ! -f $EXECUTIONDIR/jwt.hex ]
then
	echo "creating new jtw.hex file"
	openssl rand -hex 32 | tr -d "\n" > "$EXECUTIONDIR"/jwt.hex
else
	echo "using existing jwt.hex file"
fi

docker-compose up -d
