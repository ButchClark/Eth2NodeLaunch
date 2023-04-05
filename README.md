# Eth2NodeLaunch
This tool uses a docker-compose file to launch both an execution node and a consensus node for the Ethereum 2.0 network. 

Currently (being read-only) it runs against mainnet.  Before actually staking, it will need to be updated to first test against the Goerli testnet.

## Prerequisites
- Docker

## Steps to run
Note:  I run on a MacBook Pro, so the following probably won't work directly on a Windows machine.

1. Clone this repo
2. cd into repo directory
3. Run `./launch.sh`
4. Verify the nodes have started properly by running `docker-compose logs -f`
5. Wait for the nodes to sync

## Monitoring the nodes
When the docker-compose file executes, it launches both Prometheus and Grafana images.  To access the Grafana instance, go to `http://localhost:3000`

First, log into Grafana.  
By default, the instance will start with username/password:   Admin / Admin

You will find a pre-configured dashboard named *Execution Node Stats*.  This (presently) show the count of Active Peers for the Execution-client.

## Shutting things down
1. Run `docker-compose down`
2. To reset everything, including deleting any execution and consensus node data, run `./cleanup.sh`

## Notes:
Next steps include parameterizing the docker-compose file to allow for different networks (mainnet, goerli, etc.)

### Updating Grafana and Prometheus
The launch script will copy init scripts and dashboard JSON files to the appropriate directories.  All you need to do is update the files in the {project}/grafana and {project}/prometheus directories before running the launch script.

Until complexity warrants Dockerfiles, I've kept all config in the docker-compose file.

## Interesting links

| link | description |
| --- | --- |
| https://geth.ethereum.org/docs/fundamentals/command-line-options | geth command line options |
| https://docs.prylabs.network/docs/install/install-with-docker | prysm install with docker |
| https://eth-docker.net/ | eth-docker |
| https://github.com/d3vk0n/goerli-geth | goerli geth |
| https://github.com/islishude/geth-docker | get-docker |
| https://github.com/chapsuk/geth-prometheus | geth-prometheus |
| https://grafana.com/grafana/dashboards/15750-geth-server/ | geth grafana dashboard |


