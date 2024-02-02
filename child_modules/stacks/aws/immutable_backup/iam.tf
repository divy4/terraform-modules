resource "aws_iam_user" "writer" {
  name = "${module.common.aws.iam.name_prefix}-writer"
  tags = module.common.aws.tags
}

data "aws_iam_policy_document" "writer" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject*"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.main.id}/*"]
  }
}

resource "aws_iam_user_policy" "writer" {
  name   = "${module.common.aws.iam.name_prefix}-writer"
  user   = aws_iam_user.writer.name
  policy = data.aws_iam_policy_document.writer.json
}
