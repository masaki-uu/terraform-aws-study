locals {
  eks_configmap = <<CONFIGMAPAWSAUTH
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
CONFIGMAPAWSAUTH
}

resource "aws_eks_cluster" "this" {
  name     = local.cluster_name
  role_arn = var.eks_master_role_arn
  version  = var.eks_cluster_version

  vpc_config {

    subnet_ids = var.subnet_ids
  }
}
