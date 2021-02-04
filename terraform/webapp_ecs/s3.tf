data "aws_iam_policy_document" "s3_access" {
  statement {
    sid = "1"

    effect = "Allow"
    actions = ["s3:*"]
    resources = [
      "arn:aws:s3:::${var.bucket_name}",
    ]
  }
}

resource "aws_s3_bucket" "webapp_ecs_storage" {
  bucket = var.bucket_name
  acl    = "private"
}
