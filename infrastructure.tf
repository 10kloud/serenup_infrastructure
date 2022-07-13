module "database" {
  source = "./modules/database"

  timestream_db    = "${var.namespace}-${var.timestream_db}"
  timestream_table = var.timestream_table

  timestream_retention_properties = {
    magnetic_store_retention_period_in_days = 6
    memory_store_retention_period_in_hours  = 6
  }
}

module "application" {
  source = "./modules/application"

  kinesis_pipeline = "${var.namespace}-${var.kinesis_pipeline}"

  website_bucket_name = "${var.namespace}-frontend"

  identity_pool_name = "${var.namespace}-id"
}
