# Hybrid Deployment Sequence

## Dev

1. Stand up local or lab `Kafka`, `MinIO`, `Schema Registry`, and a single processing runtime.
2. Validate end-to-end ingestion, quarantine, replay, and Iceberg writes.
3. Add `Trino` for basic gold-serving tests.

## Test

1. Promote to a resilient multi-node environment.
2. Run node-failure, storage-failure, and replay drills.
3. Validate Snowflake sync only for the marts intended for cloud consumers.

## Prod

1. Freeze contracts and backup policies.
2. Roll out by source system or geography.
3. Observe Kafka lag, processing freshness, object-store growth, and query latency before increasing traffic.
