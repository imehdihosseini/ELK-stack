# Simple Elasticsearch architecture with docker

> :bell: Notice: The perpose of this repository is just for learn and analytic Elasticsearch usage and not configured to handle high traffic situation and production usage. 

This repository is going to create a stable Elasticsearch cluster with at least 3 master-data nodes, With this configuration you will be able to test your cluster and shards on critical sitatuins and see how shards migrate between nodes and how these nodes bootstrap and create quorum.

## What you will have after running docker-compose?
* 3 Elasticsearch nodes
* Kibana
* Elasticsearch HEAD plugin

## Requirements
* docker-compose >= 2
* Windows or *nix

## How to setup a cluster?
All the things you need to start is running up the compose file:
```
docker-compose up -d
```
> :small_orange_diamond: -d flag will detach the repository after running up the containers

After running the cluster you need a minutes or more depends on your harware to bootstrap the nodes and the quorum (majority of nodes to take a desition).
You can watch the Elasticsearch during the quorum with blew command:

```
docker logs -f elasticsearch
```
> :small_orange_diamond: -f flag will show you the Elasticsearch live log.

Here is the cluster status after docker-compose:
```
     Name                   Command               State                       Ports                     
--------------------------------------------------------------------------------------------------------
elasticsearch    /usr/local/bin/docker-entr ...   Up      0.0.0.0:9200->9200/tcp, 0.0.0.0:9300->9300/tcp
elasticsearch2   /usr/local/bin/docker-entr ...   Up      9200/tcp, 9300/tcp                            
elasticsearch3   /usr/local/bin/docker-entr ...   Up      9200/tcp, 9300/tcp                            
head             /bin/sh -c grunt server          Up      0.0.0.0:9100->9100/tcp                        
kibana           /usr/local/bin/kibana-docker     Up      0.0.0.0:5601->5601/tcp 
```
So, All the services would be accessible throw folloing ports:

Service Name | Url and Port
------------ | -------------
Elasticsearch | localhost:9200
Kibana | localhost:5601
Elasticsearch Head plugin | localhost:9100

## Feeding the Elasticsearch with fake data
It's easy to feed your Elasticsearch with Elasticsearch's shakespeear fake data, All you need is running one the scripts depends on your OS.
```
# Linux, Mac or Unix
./feeder.sh

# Windows
./feeder.ps1
```
