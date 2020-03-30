# Devicenator Infrastructure

Steps to deploy the infrastructure for devicenator.com project
1. Execute the script `terraform/1-infrastructure/1-statebucket/apply.sh`
2. Execute the terraform files in `terraform/1-infrastructure/2-dns`
3. [Manual step] Go to cdmon and configure the name servers for the domain.
4. Execute the terraform files in `terraform/2-devicenator-ui`
5. [Manual step] Go to travis and configure the environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
