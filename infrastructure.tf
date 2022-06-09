module "database" {
  source = "./modules/database"

  timestream_db    = "${var.namespace}-${var.timestream_db}"
  timestream_table = var.timestream_table

  timestream_retention_properties = {
    magnetic_store_retention_period_in_days = 6
    memory_store_retention_period_in_hours  = 6
  }

  tags = var.tags
}
