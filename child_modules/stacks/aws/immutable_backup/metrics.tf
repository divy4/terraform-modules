resource "aws_cloudwatch_metric_alarm" "main" {
  alarm_name          = "${module.common.stack_name}-bucket-size"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  namespace           = "AWS/S3"
  metric_name         = "BucketSizeBytes"
  period              = 60 * 60 # One hour
  statistic           = "Maximum"
  threshold           = pow(1000, 4) * var.alert_threshold_terabytes
  alarm_actions       = []
  alarm_description   = "Monitors the storage usage of ${aws_s3_bucket.main.arn}."
  datapoints_to_alarm = 1
  tags                = module.common.aws.tags
}