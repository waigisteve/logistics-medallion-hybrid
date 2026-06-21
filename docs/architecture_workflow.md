# Hybrid Architecture Workflow

<table>
  <tr>
    <td align="center"><img src="assets/icons/apache-kafka.svg" width="56" alt="Apache Kafka"><br><strong>Kafka</strong><br>Ingestion bus</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/minio.svg" width="56" alt="MinIO"><br><strong>MinIO</strong><br>Bronze raw landing</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/apache-spark.svg" width="56" alt="Apache Spark"><br><strong>Spark Structured Streaming</strong><br>Streaming transform path</td>
    <td align="center">or</td>
    <td align="center"><img src="assets/icons/apache-flink.svg" width="56" alt="Apache Flink"><br><strong>Apache Flink</strong><br>Stateful stream processing</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/minio.svg" width="56" alt="MinIO"><br><strong>MinIO + Iceberg</strong><br>Silver and gold medallion store</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/trino.svg" width="56" alt="Trino"><br><strong>Trino</strong><br>Primary on-prem serving</td>
    <td align="center">or</td>
    <td align="center"><img src="assets/icons/snowflake.svg" width="56" alt="Snowflake"><br><strong>Snowflake</strong><br>Optional external serving</td>
  </tr>
</table>

## Control Overlay

<table>
  <tr>
    <td align="center"><img src="assets/icons/apache-airflow.svg" width="44" alt="Apache Airflow"><br><strong>Airflow</strong><br>Controlled delete, replay, and backfill workflows</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/apache-kafka.svg" width="44" alt="Apache Kafka"><br><strong>Kafka Retention</strong><br>Replay and duplicate investigation window</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/minio.svg" width="44" alt="MinIO"><br><strong>MinIO Versioning</strong><br>Delete protection and object integrity</td>
  </tr>
</table>
