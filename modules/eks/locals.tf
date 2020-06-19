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

  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.this.endpoint}
    certificate-authority-data: ${aws_eks_cluster.this.certificate_authority[0].data}
  name: ${aws_eks_cluster.this.name}
contexts:
- context:
    cluster: ${aws_eks_cluster.this.name}
    user: ${aws_eks_cluster.this.name}
  name: ${aws_eks_cluster.this.name}
current-context: ${aws_eks_cluster.this.name}
kind: Config
preferences: {}
users:
- name: ${aws_eks_cluster.this.name}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws
      args:
      args:
        - eks
        - get-token
        - --cluster-name
        - ${aws_eks_cluster.this.name}
KUBECONFIG

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
