env = dev

init:
	@cd config/$(env) && \
	terraform init

plan:
	@cd config/$(env) && \
	terraform plan

provision:
	@cd config/$(env) && \
	terraform apply --auto-approve

kubeconfig:
	@aws eks update-kubeconfig --name $(shell terraform output -state=config/$(env)/terraform.tfstate cluster_name) --alias eks

switch-context:
	@kubectl config use-context eks

aws-auth:
	@terraform output -state=config/$(env)/terraform.tfstate eks_configmap > _aws_auth.yaml
	@kubectl create -f _aws_auth.yaml
	@rm -f _aws_auth.yaml

destroy-plan:
	@cd config/$(env) && \
	terraform plan -destroy

destroy:
	@cd config/$(env) && \
	terraform destroy --auto-approve
