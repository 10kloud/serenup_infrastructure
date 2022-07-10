resource "aws_kinesis_stream" "ingester" {
  name = "${var.kinesis_pipeline}-ingester"

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }
}

resource "aws_s3_bucket" "data_warehouse" {
  bucket = replace("${var.kinesis_pipeline}-data-warehouse", "_", "-")
}
resource "aws_s3_bucket_acl" "data_warehouse_acl" {
  bucket = aws_s3_bucket.data_warehouse.id
  acl    = "private"
}

module "kinesis_to_s3" {
  source = "./firehose_to_s3"

  delivery_stream_name = "${var.kinesis_pipeline}-ingester"
  s3_bucket_arn        = aws_s3_bucket.data_warehouse.arn
  kinesis_stream_arn   = aws_kinesis_stream.ingester.arn
}
