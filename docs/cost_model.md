# Hybrid Cost Model

## Primary Cost Drivers

- `Kafka`: broker count, storage, and replication factor
- `MinIO`: object capacity, disk class, and erasure-coding overhead
- `Spark` or `Flink`: steady-state compute reservation
- `Airflow`: scheduler and worker runtime
- `Trino`: coordinator sizing and concurrent query load
- Optional `Snowflake` or cloud replication: egress and downstream warehouse runtime

## Main Levers

- Right-size broker and object-store clusters from retained event volume.
- Keep bronze retention separate from silver and gold performance storage.
- Schedule heavy backfills away from peak operational windows.
- Only replicate curated gold data to cloud consumers that need it.

## Risk Areas

- Underestimating storage growth for retained replay windows
- Running always-on compute for workloads that could be scheduled
- Cross-site replication or cloud egress surprising the spend model
