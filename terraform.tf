terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.5.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-file-pradeep"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-table"
    profile        = "default"
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

