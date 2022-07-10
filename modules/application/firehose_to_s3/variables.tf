variable "delivery_stream_name" {
  description = "Name of the Kinesis Firehose stream"
  type        = string
}

variable "kinesis_stream_arn" {
  description = "The ARN of the source kinesis data stream"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket to store data"
  type        = string
}
