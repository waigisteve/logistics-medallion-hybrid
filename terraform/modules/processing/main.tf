variable "name_prefix" {
  type = string
}

resource "terraform_data" "processing_blueprint" {
  input = {
    runtimes     = ["spark_structured_streaming", "flink"]
    orchestrator = "airflow"
  }
}
