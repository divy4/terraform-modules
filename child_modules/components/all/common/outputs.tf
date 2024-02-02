output "aws" {
  value = {
    iam = {
      name_prefix = "${var.stack_name}"
    }
    s3 = {
      name_prefix = "com-danivy-${var.stack_name}"
    }
    tags = {
      provisioner = "terraform"
      stack       = var.stack_name
    }
  }
}

output "stack_name" {
  value = var.stack_name
}
