terraform {
  required_version = ">= 1.7"

  backend "s3" {
    bucket = "com-danivy-terraform-state"
    key    = "prd.tfstate"
    region = "us-east-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {}

