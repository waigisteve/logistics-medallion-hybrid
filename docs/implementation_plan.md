# Hybrid Implementation Plan

## End-to-End Workflow

1. Publish into `Kafka`.
2. Land bronze data in `MinIO`.
3. Validate and enrich using `Spark Structured Streaming` or `Flink`.
4. Enforce schema contracts with `Schema Registry`.
5. Persist silver and gold `Iceberg` tables.
6. Serve operations through `Trino`.
7. Sync selected gold datasets to `Snowflake` only where cloud consumers require it.
8. Orchestrate replays, quality checks, and promotions with `Airflow`.

## Hosting Options

- `Fully on-prem`: best for strict sovereignty
- `Hybrid burst`: core ingestion on-prem, selected analytics in cloud
- `Managed control plane`: self-hosted data plane with managed observability or CI

## Medallion Design

| Layer | Hybrid Implementation |
|---|---|
| Bronze | Raw immutable objects in `MinIO` and replayable source topics in `Kafka` |
| Silver | Canonical conformed `Iceberg` tables built by Spark or Flink |
| Gold | KPI marts, reconciliation tables, and feature datasets queried by `Trino` and optionally synced to `Snowflake` |

## Tool Definitions

| Tool | Why It Is Here |
|---|---|
| `Kafka` | High-volume ingress, source decoupling, and replay |
| `MinIO` | S3-compatible storage for medallion layers without cloud lock-in |
| `Spark Structured Streaming` or `Flink` | Stateful event processing and late data handling |
| `Iceberg` | Open format for partition evolution and time-travel capable tables |
| `Airflow` | Backfills, promotions, reconciliation, and warehouse synchronization |
| `Trino` | Interactive operational and analyst access over medallion datasets |
| `Schema Registry` | Producer and consumer contract governance |
| `OpenMetadata` or `DataHub` | Catalog, lineage, stewardship, and policy context |
| `Vault` | Centralized secrets management |

## Cost Strategy

- Trade cloud service fees for platform engineering effort.
- Reuse shared compute and object storage, but budget for operations, backups, and DR.
- Keep the first version small; this route becomes expensive if overbuilt before demand is proven.

## Delivery Plan

1. `dev`: single-site cluster, synthetic data, and core contract tests
2. `test`: multi-node resilience, replay drills, and failover validation
3. `prod`: separated control plane, backup verification, and documented break-glass procedures

## Terraform Mapping

| Module | Responsibility |
|---|---|
| `security` | Vault, PKI, and encryption anchors |
| `streaming` | Kafka topics, retention, and source segmentation blueprint |
| `data_lake` | MinIO and Iceberg layout blueprint |
| `processing` | Spark/Flink and orchestration blueprint |
| `warehouse_integration` | Trino serving and optional Snowflake export blueprint |
| `observability` | Metrics, logs, and tracing blueprint |
