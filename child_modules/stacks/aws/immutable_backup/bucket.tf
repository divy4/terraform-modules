resource "aws_s3_bucket" "main" {
  bucket              = module.common.aws.s3.name_prefix
  object_lock_enabled = true
  tags                = module.common.aws.tags
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    mfa_delete = "Disabled"
    status     = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "main" {
  bucket = aws_s3_bucket.main.id
  rule {
    default_retention {
      days = var.retention_length_days
      mode = "COMPLIANCE"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "main" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.main]

  bucket = aws_s3_bucket.main.id

  rule {
    id     = "expiration"
    status = "Enabled"

    filter {}

    expiration {
      days = var.retention_length_days
    }

    noncurrent_version_expiration {
      noncurrent_days = 1
    }
  }

  rule {
    id = "storage-type"
    status = "Enabled"

    transition {
      days          = 0
      storage_class = "DEEP_ARCHIVE"
    }
  }
}
