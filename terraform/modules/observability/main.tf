variable "name_prefix" {
  type = string
}

resource "terraform_data" "observability_blueprint" {
  input = {
    metrics = ["prometheus", "grafana"]
    logs    = ["loki_or_opensearch"]
    traces  = ["opentelemetry"]
  }
}
