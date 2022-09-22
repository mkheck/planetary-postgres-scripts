#!/bin/bash
# Author  : Mark A. Heckler
# Notes   : Run with 'source CosmosPostgresConfig.sh' from your shell/commandline environment AFTER CosmosPostgresInitEnv.sh
# History : 20220915 Official "version 1"
#         : 20220922 Added scripted firewall rule creation for local development machine (for dev only, remove when deploying app to Azure)

# REQUIREMENTS
## Azure CLI (az)

# Resource group config
echo '>> az group create -l $AZ_LOCATION -g $AZ_RESOURCE_GROUP --subscription $AZ_SUBSCRIPTION'
az group create -l $AZ_LOCATION -g $AZ_RESOURCE_GROUP --subscription $AZ_SUBSCRIPTION

# Cosmos/SQL option
echo '>> az postgres server create -n $COSMOSDB_PGSQL_SERVER -g $AZ_RESOURCE_GROUP -u $COSMOSDB_PGSQL_ADMINUID -p $COSMOSDB_PGSQL_PASSWORD'
az postgres server create -n $COSMOSDB_PGSQL_SERVER -g $AZ_RESOURCE_GROUP -u $COSMOSDB_PGSQL_ADMINUID -p $COSMOSDB_PGSQL_PASSWORD
echo '>> az postgres db create -n $COSMOSDB_PGSQL_DATABASE -g $AZ_RESOURCE_GROUP -s $COSMOSDB_PGSQL_SERVER'
az postgres db create -n $COSMOSDB_PGSQL_DATABASE -g $AZ_RESOURCE_GROUP -s $COSMOSDB_PGSQL_SERVER

# Create firewall rule for current (local) dev machine
az postgres server firewall-rule create -g $AZ_RESOURCE_GROUP -s $COSMOSDB_PGSQL_SERVER -n allowip --start-ip-address $AZ_LOCAL_IP --end-ip-address $AZ_LOCAL_IP
