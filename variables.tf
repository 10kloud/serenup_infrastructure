variable "namespace" {
  description = "Name of the timestream database"
  type        = string
}

variable "timestream_db" {
  description = "Name of the timestream database"
  type        = string
}

variable "timestream_table" {
  description = "Name of the timestream database"
  type        = string
}

variable "kinesis_pipeline" {
  description = "Name of the kinesis data pipeline"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the RDS instance"
  type        = map(string)
}
