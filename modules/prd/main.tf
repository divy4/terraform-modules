resource "aws_iam_user" "main" {
  for_each = local.users
  name     = each.key
  tags = {
    iam_user_type = "human"
  }
}

module "immutable_backup_dan" {
  source                    = "../../child_modules/stacks/aws/immutable_backup"
  alert_threshold_terabytes = 0.1
  manager_iam_user          = aws_iam_user.main["dan"]
  retention_length_days     = 180
  stack_name                = "dan-backup-vault"
}

module "immutable_backup_dave" {
  source                    = "../../child_modules/stacks/aws/immutable_backup"
  alert_threshold_terabytes = 0.1
  manager_iam_user          = aws_iam_user.main["dave"]
  retention_length_days     = 180
  stack_name                = "dave-backup-vault"
}