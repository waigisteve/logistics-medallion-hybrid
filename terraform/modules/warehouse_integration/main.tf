variable "name_prefix" {
  type = string
}

resource "terraform_data" "warehouse_blueprint" {
  input = {
    serving        = ["trino", "optional_snowflake_sync"]
    sync_frequency = "5m_to_daily"
  }
}
