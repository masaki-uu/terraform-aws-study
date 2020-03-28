provider "aws" {
  region  = var.region
  version = "~> 2.0"
  profile = var.profile

  ignore_tag_prefixes = ["kubernetes.io/cluster/"]
}
