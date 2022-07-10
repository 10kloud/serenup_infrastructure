variable "timestream_db" {
  description = "Name of the timestream database"
  type        = string
}
variable "timestream_table" {
  description = "Name of the timestream table to create"
  type        = string
}


variable "timestream_retention_properties" {
  description = "Retention policies"
  type = object({
    magnetic_store_retention_period_in_days = number
    memory_store_retention_period_in_hours  = number
  })

  default = {
    magnetic_store_retention_period_in_days = 2
    memory_store_retention_period_in_hours  = 6
  }
}
