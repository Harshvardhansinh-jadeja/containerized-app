.DEFAULT_GOAL := hello_world

export TF_VAR_profile?=harshvardhan 
export TF_VAR_environment=sandbox
export ssm_env?=sandbox
INFRA:= Infrastructure

hello_world:
	@echo "Hello world"

Infra_Plan: workspace format validate plan 

destroy:
	terraform destroy -auto-approve

init_backend:
	cd Infrastructure; \
	terraform init -backend-config="$(backend).s3.tfbackend"

init:
	terraform init

workspace : 
	cd Infrastructure; \
	terraform workspace select ${workspace} 

plan:
	cd Infrastructure; \
	terraform plan;

	# cd Infrastructure; \
	# ls -lart; \
	# rm -rf .terraform*; \
	# ls -lart; \
	# terraform init -backend-config="$(backend).s3.tfbackend"; \
	# ls -lart; \
	# pwd; \
	# sleep 10; \
	# terraform state list; \
	# # terraform destroy; \
	# terraform apply -auto-approve

apply:
	cd Infrastructure; \
	terraform apply -auto-approve

target:
	cd Infrastructure; \
	terraform apply -target=${resource} -auto-approve

format:
	cd Infrastructure; \
	terraform fmt -recursive

validate:
	cd Infrastructure; \
	terraform validate

docker: image_build image_push

image_build:
	docker build -t ${name} ${path}

image_push:
	docker push ${name}

ssm:
	bash ./scripts/ssm.sh


ssm_param:
ifeq ($(profile),)
	@aws --region=us-west-2 ssm get-parameter --name ${ssm_prefix}${param} --with-decryption --output text --query Parameter.Value 
else
	@aws --region=us-west-2 --profile $(profile) ssm get-parameter --name ${ssm_prefix}${param} --with-decryption --output text --query Parameter.Value
endif

ecr:
ifeq ($(profile),)
	@aws ecr describe-repositories --repository-names $(name)
else
	@aws ecr describe-repositories --repository-names $(name) --profile $(profile)
endif