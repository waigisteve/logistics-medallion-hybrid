module "security" {
  source      = "./modules/security"
  name_prefix = local.name_prefix
}

module "streaming" {
  source      = "./modules/streaming"
  name_prefix = local.name_prefix
}

module "data_lake" {
  source      = "./modules/data_lake"
  name_prefix = local.name_prefix
}

module "processing" {
  source      = "./modules/processing"
  name_prefix = local.name_prefix
}

module "warehouse_integration" {
  source      = "./modules/warehouse_integration"
  name_prefix = local.name_prefix
}

module "observability" {
  source      = "./modules/observability"
  name_prefix = local.name_prefix
}
