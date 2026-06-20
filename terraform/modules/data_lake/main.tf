variable "name_prefix" {
  type = string
}

resource "terraform_data" "data_lake_blueprint" {
  input = {
    object_store = "minio"
    table_format = "iceberg"
    layers       = ["bronze", "silver", "gold"]
  }
}
