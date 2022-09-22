#!/bin/bash
# Author  : Mark A. Heckler
# Notes   : Run with 'source CosmosPostgresInitEnv.sh' from your shell/commandline environment
# History : 20220915 Official "version 1"
#         : 20220922 Added AZ_LOCAL_IP env var for local development machine (for dev only, remove when deploying app to Azure)

# REQUIREMENTS
## Azure CLI (az)

# Your Azure ID
export AZUREID='<your_azure_id>'

# Establish seed for random naming
export RANDOMIZER=$RANDOM
# Can swap these two lines if you need to re-run config script to get env vars back for work with existing server+database
# export RANDOMIZER=<static_number>

# Azure subscription to use
export AZ_SUBSCRIPTION='<insert_your_azure_subscription_here>'
export AZ_RESOURCE_GROUP=$AZUREID'-'$RANDOMIZER'-rg'
export AZ_LOCATION=<insert_your_preferred_region_here>
export AZ_LOCAL_IP=$(curl ifconfig.me/ip)

# Database
export COSMOSDB_PGSQL_SERVER=$AZUREID'-cosmospgsvr'
export COSMOSDB_PGSQL_ADMINUID=$AZUREID'admin'
export COSMOSDB_PGSQL_PASSWORD=$AZUREID'Password123!'
export COSMOSDB_PGSQL_DATABASE=$AZUREID'-cosmospgdb'
