# Example Debezium setup

Uses the example configuration from the [Debezium tutorial](https://debezium.io/documentation/reference/1.8/tutorial.html) and turns it into a Docker Compose file, using PostgreSQL instead of MySQL.

## Requirements

- Docker 20.10+

## Installation

Run `docker compose up` from the root of the project directory.

Check to see if the connector is configured:

```bash
curl -H "Accept:application/json" localhost:8083/connectors/
```

Connect to the database:

```bash
psql -h localhost -U postgres -d postgres -W
```

(Substitute with actual database user, name, and password if necessary. Also make sure any local PostgreSQL server that may already be running on your system is stopped or do the appropriate port remapping to make sure you're connecting to the database server in the Docker container.)


## Notes

- This setup uses the Debezium supplied images for Zookeeper, Kafka, Kafka Connect, and PostgreSQL. Presumably in production, one would be more likely to use RDS or a similar managed service to host the database, rather than running it on a container. See [documentation](https://debezium.io/documentation/reference/1.8/connectors/postgresql.html#setting-up-postgresql) on how to configure cloud-hosted PostgreSQL servers to work with Debezium.
- The tutorial uses a database image seeded with some example data; this setup uses just the base database image. Change `debezium/postgres:14` to `debezium/example-postgres:1.8` if you want to use the seeded database.
- The command to configure the `PostgresConnector` needs the Kafka Connect API to be available but it takes longer for Kafka Connect to finish starting after its container is already up and running. Thus, the `depends_on` requirement is insufficient, and the additional `while` loop in `bin/set-up-connector.sh` checks to see if the endpoint is up before adding the connector.

## To Do

[ ] Example Terraform for configuring AWS RDS and ECS
[ ]
