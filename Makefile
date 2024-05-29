SHELL=/bin/bash
.DEFAULT_GOAL := plan

INFRA= Infrastructure
_AWS_REGION=us-west-2
_ENV?=dev
TERRAGRUNT_PATH=Infrastructure/environment/$(_ENV)
profile=sandbox

.EXPORT_ALL_VARIABLES:
TF_VAR_env=$(_ENV)
TF_VAR_profile=$(profile)
ssm_env?=sandbox
TF_VAR_environment=sandbox
TF_VAR_aws_region=$(_AWS_REGION)
TF_VAR_tf_bucket=harshvardhan-terragrunt

## login into AWS SSO for AWS CLI
sso:
	@aws sso login --profile $(profile)

## terraform commands
init-upgrade: tf
	@cd $(TERRAGRUNT_PATH) && terragrunt init --upgrade

init plan apply show destroy: tf
	@cd $(TERRAGRUNT_PATH) && terragrunt $@
# apply terraform wihtout asking input `yes`
apply-ci:
	@cd $(TERRAGRUNT_PATH) && terragrunt apply -auto-approve
# remove tfstate file lock
rmtflock: tf
	@cd $(TERRAGRUNT_PATH) && terragrunt force-unlock $(lock_id)
# run apply command for targeted resource
tftarget:
	@cd $(TERRAGRUNT_PATH) && terragrunt apply -target $(resource_id)
tfdestroy:
	@cd $(TERRAGRUNT_PATH) && terragrunt destroy -target $(resource_id)
# show terraform outputs
tfoutput:
	@cd $(TERRAGRUNT_PATH) && terragrunt output --json 2> /dev/null
# validate terraform code
tfvalidate:
	@cd $(shell make init 2>&1 |grep "working directory to" |awk '{print $$8}') && terraform validate
# formating terraform and terragrunt code
tfstate:
	@cd $(TERRAGRUNT_PATH) && terragrunt state list

fmt:
	@terraform fmt --recursive
	@terragrunt hclfmt
# import terraform resource
tfimport:
	@cd $(TERRAGRUNT_PATH) && terragrunt import $(resource_id) $(remote_resource_id)
# install/set terraform and terragrunt version
tf:
	@tfswitch
	@tgswitch

tfrmstate: 
	@cd $(TERRAGRUNT_PATH) && terragrunt state rm $(resource_id)

tfstatemv:
	@cd $(TERRAGRUNT_PATH) && terragrunt state mv $(source_resource_id) $(target_resource_id)

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
