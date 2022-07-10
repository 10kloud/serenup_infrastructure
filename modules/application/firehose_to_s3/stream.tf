resource "aws_kinesis_firehose_delivery_stream" "stream" {
  name        = var.delivery_stream_name
  destination = "extended_s3"

  kinesis_source_configuration {
    kinesis_stream_arn = var.kinesis_stream_arn
    role_arn           = aws_iam_role.kinesis_role.arn
  }

  extended_s3_configuration {
    bucket_arn = var.s3_bucket_arn
    role_arn   = aws_iam_role.s3_role.arn

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = var.delivery_stream_name
      log_stream_name = var.delivery_stream_name
    }
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "firehose.amazonaws.com"
      ]
    }
  }
}
