variable "name_prefix" {
  type = string
}

resource "terraform_data" "streaming_blueprint" {
  input = {
    platform        = "kafka"
    topic_pattern   = "${var.name_prefix}.events.*"
    retention_hours = 168
  }
}
