terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.10"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile

  ignore_tags {
    key_prefixes = ["kubernetes.io/cluster/"]
  }
}
