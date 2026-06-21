# Hybrid Integrity And Security Controls

## Data Deletion

- `Kafka` retention protects replay windows after downstream loss.
- `MinIO` versioning and Iceberg snapshots protect bronze, silver, and gold data from accidental deletion.
- Controlled purge and replay should run only through `Airflow` workflows.

## Data Duplication

- Duplicate events remain visible in bronze for investigation.
- `Spark` or `Flink` should enforce deterministic keys and idempotent writes into Iceberg tables.
- Downstream `Trino` or optional Snowflake serving must consume deduplicated curated data only.

## Security Infiltration

- Separate principals for Kafka producers, processors, orchestrators, and administrators.
- Protect secrets centrally and monitor access failures, unexpected deletes, and topic ACL violations.
- Keep serving and transformation runtimes isolated to reduce compromise blast radius.

## Integrity Outcome

The route remains recoverable because replay, versioning, snapshots, and controlled orchestration are all first-class parts of the workflow.
