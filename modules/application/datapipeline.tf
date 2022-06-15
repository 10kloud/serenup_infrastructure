resource "aws_kinesis_stream" "ingester" {
  name = "${var.kinesis_pipeline}-ingester"

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }

  tags = var.tags
}
