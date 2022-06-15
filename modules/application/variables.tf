variable "kinesis_pipeline" {
  description = "Name of the kinesis data pipeline"
  type        = string
}

variable "tags" {
  description = "Global resources tags"
  type        = map(string)
  default     = {}
}
