# Devicenator Infrastructure

Steps to deploy the infrastructure for devicenator.com project
1. Execute the script `terraform/1-statebucket/apply.sh`
1. Execute the terraform files in `terraform/2-devicenator-ui`
2. [Manual step] Go to travis and configure the environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
