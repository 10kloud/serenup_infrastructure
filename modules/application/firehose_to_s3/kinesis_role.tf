resource "aws_iam_role" "kinesis_role" {
  name               = "${var.delivery_stream_name}_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_policy" "kinesis_role" {
  name   = "${var.delivery_stream_name}_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.kinesis_role.json
}

resource "aws_iam_policy_attachment" "kinesis_role" {
  name       = "${var.delivery_stream_name}_kinesis_role"
  roles      = [aws_iam_role.kinesis_role.name]
  policy_arn = aws_iam_policy.kinesis_role.arn
}

data "aws_iam_policy_document" "kinesis_role" {
  statement {
    sid = "AllowReadStream"
    actions = [
      "kinesis:DescribeStream",
      "kinesis:GetRecords",
      "kinesis:GetShardIterator",
      "kinesis:ListShards"
    ]
    effect = "Allow"
    resources = [
      var.kinesis_stream_arn
    ]
  }
}

