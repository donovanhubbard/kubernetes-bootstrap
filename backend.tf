terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.36.1"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}