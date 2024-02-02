# Reader

data "aws_iam_policy_document" "manager" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListAllMyBuckets"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketObjectLockConfiguration",
      "s3:GetBucketVersioning",
      "s3:ListBucket",
      "s3:ListBucketVersions"
    ]
    resources = [aws_s3_bucket.main.arn]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:DeleteObject",
      "s3:DeleteObjectVersion",
      "s3:GetObject",
      "s3:GetObjectTagging",
      "s3:GetObjectVersionTagging",
      "s3:PutObjectTagging"
    ]
    resources = ["${aws_s3_bucket.main.arn}/*"]
  }
}

resource "aws_iam_user_policy" "manager" {
  name   = "${module.common.aws.iam.name_prefix}-manager"
  user   = var.manager_iam_user.name
  policy = data.aws_iam_policy_document.manager.json
}

# Writer

resource "aws_iam_user" "writer" {
  name = "${module.common.aws.iam.name_prefix}-writer"
  tags = module.common.aws.tags
}

data "aws_iam_policy_document" "writer" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.main.arn}/*"]
  }
}

resource "aws_iam_user_policy" "writer" {
  name   = aws_iam_user.writer.name
  user   = aws_iam_user.writer.name
  policy = data.aws_iam_policy_document.writer.json
}
