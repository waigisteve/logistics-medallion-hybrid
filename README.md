# Hybrid Route

This route is the alternative for on-prem or hybrid hosting.

## Repository Navigation

- `docs/implementation_plan.md`
- `docs/tooling_and_workflow.md`
- `docs/deployment_sequence.md`
- `docs/cost_model.md`
- `docs/platform_options.md`
- `docs/architecture_workflow.md`
- `docs/integrity_security_controls.md`
- `terraform/README.md`

Recommended stack:

- `Kafka` for ingestion
- `MinIO` for bronze, silver, and gold object storage
- `Spark Structured Streaming` or `Flink` for processing
- `Airflow` for orchestration
- `Iceberg` tables
- `Trino` for interactive access
- Optional `Snowflake` or cloud object replication for selected downstream use cases

## Route Intent

This route is for cases where sovereignty, local processing, or stable steady-state costs matter enough to justify running key platform components outside a managed cloud stack.

It is designed to support:

- Full on-prem deployment
- Hybrid deployment where ingestion and bronze stay on-prem but curated gold data is shared to cloud consumers
- Controlled future migration into AWS, Azure, or GCP without redesigning the medallion pattern

## Defined Tools

| Stage | Primary Tool | Role |
|---|---|---|
| Ingestion | `Apache Kafka` | Event bus with replay and source isolation |
| Bronze/Silver/Gold object storage | `MinIO` | S3-compatible object store for medallion layers |
| Stream processing | `Spark Structured Streaming` or `Apache Flink` | Event validation, deduplication, enrichment, watermarking, and quarantine |
| Table format | `Apache Iceberg` | Open table layer for governed silver and gold datasets |
| Orchestration | `Apache Airflow` | Backfills, promotions, data quality checks, and sync workflows |
| Serving | `Trino` | Interactive query engine over on-prem medallion layers |
| Optional warehouse | `Snowflake` | Shared gold-serving target for external BI or finance workloads |
| Governance | `Schema Registry`, `OpenMetadata` or `DataHub`, `Vault` | Contracts, metadata, lineage, and secrets management |
| Observability | `Prometheus`, `Grafana`, `Loki`, `OpenTelemetry` | Metrics, logs, traces, and alerting |

## Scaffold Contents

- `docs/implementation_plan.md`: route workflow and architecture plan
- `docs/tooling_and_workflow.md`: defined tools and stage ownership
- `docs/deployment_sequence.md`: phased rollout by environment
- `docs/platform_options.md`: on-prem topology choices
- `terraform/`: modular scaffold for `dev`, `test`, and `prod`
- `.github/workflows/terraform.yml`: CI validation skeleton

## Why This Route

- Best for sovereignty, data locality, and controlled steady-state cost.
- Highest platform ownership burden of the four options.
