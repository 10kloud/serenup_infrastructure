resource "aws_iam_role" "s3_role" {
  name               = var.delivery_stream_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_policy" "s3_role" {
  name   = var.delivery_stream_name
  path   = "/"
  policy = data.aws_iam_policy_document.s3_role.json
}

resource "aws_iam_policy_attachment" "s3_role" {
  name       = "${var.delivery_stream_name}_s3_role"
  roles      = [aws_iam_role.s3_role.name]
  policy_arn = aws_iam_policy.s3_role.arn
}

data "aws_iam_policy_document" "s3_role" {
  // S3 Policies
  statement {
    sid = "AllowBucketSync"
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject"
    ]
    effect = "Allow"
    resources = [
      var.s3_bucket_arn,
      format("%s/*", var.s3_bucket_arn),
    ]
  }

  statement {
    sid = "AllowPutLogEvents"
    actions = [
      "logs:PutLogEvents"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}
