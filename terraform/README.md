# Hybrid Terraform Scaffold

This scaffold is intentionally blueprint-oriented because on-prem targets differ more than cloud targets.

## Modules

- `security`: Vault, encryption, and PKI blueprint
- `streaming`: Kafka topic and retention blueprint
- `data_lake`: MinIO and Iceberg blueprint
- `processing`: Spark/Flink and Airflow blueprint
- `warehouse_integration`: Trino and optional Snowflake sync blueprint
- `observability`: Prometheus, Grafana, Loki, and OpenTelemetry blueprint

## Environments

- `envs/dev`
- `envs/test`
- `envs/prod`

Each environment calls the root module with target-specific values. When you pick a real platform target such as `kubernetes` or `vsphere`, these blueprint modules should be replaced or extended with provider-specific resources.
