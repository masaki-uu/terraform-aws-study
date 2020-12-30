terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.10"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.1"
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

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}