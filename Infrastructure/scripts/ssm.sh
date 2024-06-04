# #!/bin/bash

# SSM_USER=$(aws --region=us-west-2 ssm get-parameter --name "/harshvardhan/sandbox/rds/username" --with-decryption --output text --query Parameter.Value)

# SSM_PASSWORD=$(aws --region=us-west-2 ssm get-parameter --name "/harshvardhan/sandbox/rds/password" --with-decryption --output text --query Parameter.Value)

# echo "TF_VAR_username=${SSM_USER}" >> $GITHUB_ENV
# echo "TF_VAR_password=${SSM_PASSWORD}" >> $GITHUB_ENV


#!/bin/bash


PARAMS=("username" "password")
REGION="us-west-2"
PREFIX="/harshvardhan/$ssm_env/rds/"
TFVARS_FILE="./Infrastructure/terraform.tfvars"

# Getting SSM Parameter and passing it into the tfvars file.
for param in "${PARAMS[@]}"; do
    value=$(aws --region="$REGION" ssm get-parameter --name "$PREFIX$param" --with-decryption --output text --query Parameter.Value)
    # echo "TF_VAR_$param=${value}" >> $GITHUB_ENV
    echo "$param = \"$value\"" >> "$TFVARS_FILE"
done