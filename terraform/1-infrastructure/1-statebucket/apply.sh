#!/usr/bin/env bash

echo "Creating s3 state bucket and dynamo table for locking state with local state"
mv backend.tf backend.tf.backup
set -euxo pipefail
rm -rf ./.terraform
terraform init
terraform plan --out="devicenator-infra.plan"
terraform apply "devicenator-infra.plan"
mv backend.tf.backup backend.tf

echo "Enabling remote state"
rm -rf ./.terraform
terraform init
terraform plan --out="devicenator-infra.plan"
terraform apply "devicenator-infra.plan"

echo "Cleaning up old local states"
rm devicenator-infra.plan
rm terraform.tfstate
rm terraform.tfstate.backup

echo "Successfully enabled terraform remote state"
