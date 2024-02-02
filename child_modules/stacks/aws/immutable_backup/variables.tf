variable "expiration_latest_days" {
  description = "The number of days the latest version of a file should remain in the bucket."
  type = number
}

variable "expiration_nonlatest_days" {
  description = "The number of days the latest version of a file should remain in the bucket."
  type = number
}

variable "stack_name" {
  description = "The name of the stack."
  type = string
}
