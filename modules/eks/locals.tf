locals {
  name_prefix  = var.name_prefix
  cluster_name = "${var.name_prefix}-cluster"
  node_group_default = {
    gpu            = false
    desired_size   = 2
    max_size       = 3
    min_size       = 1
    instance_types = "t3.medium"
    disk_size      = 20
  }

  aws_auth = <<AWSAUTH
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${var.eks_node_role_arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
AWSAUTH
}
