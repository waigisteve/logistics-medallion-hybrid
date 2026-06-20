# Hybrid Platform Options

## Option 1: Kubernetes-Centered

- `Kafka`, `MinIO`, `Airflow`, `Trino`, and metadata services run on Kubernetes
- Best when the organization already runs a stable on-prem cluster platform
- Simplifies CI/CD and repeatable environment provisioning

## Option 2: VM-Centered

- Components run on `vSphere`, `Proxmox`, or similar VM infrastructure
- Best when platform operations are VM-oriented rather than container-oriented
- Slower to automate but often simpler for traditional infrastructure teams

## Option 3: Split Hybrid

- Kafka and MinIO remain on-prem
- Gold marts or selective datasets replicate to cloud object storage or Snowflake
- Best when core operational data must remain local but broader analytics can be cloud-hosted
