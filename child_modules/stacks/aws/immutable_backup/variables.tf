variable "alert_threshold_terabytes" {
  description = "The number of terabytes to alert on if the size of the bucket exceeds that amount."
  type        = number
}

variable "manager_iam_user" {
  description = "The IAM user that can manage files uploaded to the bucket."
}

variable "retention_length_days" {
  description = "The number of days all files uploaded to the vault must be kept."
  type        = number
}

variable "stack_name" {
  description = "The name of the stack."
  type        = string
}
