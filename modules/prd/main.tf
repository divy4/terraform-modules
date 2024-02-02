module "immutable_backup_dan" {
  source                    = "../../child_modules/stacks/aws/immutable_backup"
  expiration_latest_days    = 2
  expiration_nonlatest_days = 1
  stack_name                = "dan-backup"
}
