#!/bin/bash
docker stop execution-client
docker rm execution-client
docker stop consensus-client
docker rm consensus-client
rm -rfd ~/data/geth
rm -rfd ~/data/prysm
