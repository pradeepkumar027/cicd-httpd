terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = var.bucket
    key            = var.key
    dynamodb_table = var.dynamodb_table
    region         = var.region
    profile        = var.profile
  }
}