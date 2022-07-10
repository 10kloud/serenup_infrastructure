module "timestream_db" {
  source = "./timestream"

  database_name = var.timestream_db
  table_name    = var.timestream_table

  retention_properties = var.timestream_retention_properties
}
