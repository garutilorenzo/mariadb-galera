# mariadb-galera
MariaDB Galera cluster dockerized environment

* [MariaDB Galera](https://mariadb.com/kb/en/what-is-mariadb-galera-cluster) - MariaDB Galera Cluster is a virtually synchronous multi-master cluster for MariaDB

## Notes about environment

* the configuration of the cluster is not persistent. docker-entrypoint.sh creates the cluster each time the container starts
* the configuration of the running cluster can be fount inside the containers in /etc/mysql/mariadb.conf.d/10-galera.cnf (docker-compose exec mariadb_node01 cat "/etc/mysql/mariadb.conf.d/10-galera.cnf")
* MariaDB volumes persist until command docker-compose down -v is gived
* at first startup of the cluster or when all nodes are down set BOOTSTRAP=1 on one of the nodes (--wsrep-new-cluster) 

## Environment variables

* BOOTSTRAP: tells mariadb to start with --wsrep-new-cluster parameter
* CLUSTER_NAME: the name of the cluster
* CLUSTER_MEMBERS: comma separated list of cluster members (ip or fqdn)

# Usage

Start che cluster:

```console
docker-compose up -d
```

Stop one node:

```console
docker-compose stop mariadb_node01
```

Stop all nodes:

```console
docker-compose stop
```

To start the cluster again (whit all nodes down) run:

```console
bash restart_cluster.sh
```

This will delete all containers but the volumes with MariaDB data still exist.
Now set BOOTSTRAP=1 on one of the nodes and then start the cluster:

```console
docker-compose up -d
```

Tear down and clean all:

```console
docker-compose down -v
```

[![MariaDB Galera Cluster CI](https://github.com/garutilorenzo/mariadb-galera/actions/workflows/ci.yml/badge.svg?branch=10.3)](https://github.com/garutilorenzo/mariadb-galera/actions/workflows/ci.yml)
