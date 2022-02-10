#!/bin/sh

# Define variables
SUBSCRIPTION_ID=00000000-0000-0000-0000-000000000000
MY_CLOUD_PREFIX=cloudcomputing
MY_CLOUD_LOCATION=westeurope

PSQL_PASSWORD=$(cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-20} | head -n 1)

# Generate tfvars file
cat > terraform.tfvars << EOF
subscription_id = $SUBSCRIPTION_ID

prefix   = $MY_CLOUD_PREFIX
location = $MY_CLOUD_LOCATION

psql_admin    = "psqladmin"
psql_password = $PSQL_PASSWORD
EOF
