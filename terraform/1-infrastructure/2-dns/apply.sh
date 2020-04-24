#!/usr/bin/env bash

set -euxo pipefail

rm -rf ./.terraform
terraform init
terraform plan -out=devicenator-dns.plan
terraform apply devicenator-dns.plan

rm devicenator-dns.plan
rm -rf ./.terraform
rm terraform.tfstate
rm terraform.tfstate.backup
