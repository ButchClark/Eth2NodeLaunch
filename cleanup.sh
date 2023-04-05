#!/bin/bash
docker stop execution-client
docker rm execution-client
docker stop consensus-client
docker rm consensus-client
docker stop grafana
docker rm grafana
docker stop prometheus
docker network rm nodes
docker rm prometheus
rm -rfd ~/data/geth
rm -rfd ~/data/prysm
