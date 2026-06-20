# Hybrid Tooling And Workflow

## Stage Map

| Stage | Tool | Input | Output | Operational Focus |
|---|---|---|---|---|
| Producer ingress | `Kafka` | Shipment, GPS, temperature, and hub events | Partitioned replayable topics | Retention, lag, partition balance |
| Contract validation | `Schema Registry` | Versioned producer schemas | Accepted or rejected payload contracts | Compatibility enforcement |
| Bronze persistence | `MinIO` | Raw event payloads | Immutable bronze objects | Replay, backup, lifecycle |
| Stream processing | `Spark Structured Streaming` or `Flink` | Kafka or bronze streams | Silver records and quarantine records | Freshness, duplicates, late data |
| Table layer | `Iceberg` | Validated processed records | Silver and gold tables | Partition evolution, compaction |
| Orchestration | `Airflow` | Backfills, sync jobs, promotions | Controlled platform workflows | Scheduling, recovery |
| Serving | `Trino` | Iceberg silver and gold tables | Low-latency analytical access | Query latency, concurrency |
| Optional cloud share | `Snowflake` sync | Selected gold tables | External cloud marts | Data sharing and cost boundaries |

## Recommended On-Prem Data Domains

- `transport_events`
- `shipment_status`
- `hub_operations`
- `reference_data`
- `quarantine_events`

## Recommended Storage Layout

```text
s3://minio/bronze/source_system=<source>/event_date=<yyyy-mm-dd>/hour=<hh>/
s3://minio/silver/domain=<domain>/event_date=<yyyy-mm-dd>/hour=<hh>/
s3://minio/gold/mart=<mart>/snapshot_date=<yyyy-mm-dd>/
```

## Control Plane Split

- `Kafka`: transport and replay
- `Spark/Flink`: transformation and event-time processing
- `Airflow`: control plane and promotion logic
- `Trino`: serving access
- `OpenMetadata/DataHub`: governance plane
