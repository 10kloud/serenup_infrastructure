variable "kinesis_pipeline" {
  description = "Name of the kinesis data pipeline"
  type        = string
}

variable "identity_pool_name" {
  description = "Name of the identity pool"
  type        = string
}

variable "website_bucket_name" {
  description = "Name of the bucket used for hosting the website"
}
