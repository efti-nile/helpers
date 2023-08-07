#!/bin/bash

RESOURCE_GROUP_NAME="<resource-group-name>"
STORAGE_ACCOUNT_NAME="<storage-account-name>"
FILE_SHARE_NAME="<file-share-name>"

MNT_ROOT="/mnt/azure_fileshare"
MNT_PATH="$MNT_ROOT/$STORAGE_ACCOUNT_NAME/$FILE_SHARE_NAME"

sudo mkdir -p $MNT_PATH

# This command assumes you have logged in with `az login`
HTTP_ENDPOINT=$(az storage account show \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $STORAGE_ACCOUNT_NAME \
    --query "primaryEndpoints.file" --output tsv | tr -d '"')
SMB_PATH=$(echo $HTTP_ENDPOINT | cut -c7-${#HTTP_ENDPOINT})$FILE_SHARE_NAME

STORAGE_ACCOUNT_KEY=$(az storage account keys list \
    --resource-group $RESOURCE_GROUP_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --query "[0].value" --output tsv | tr -d '"')

sudo mount -t cifs $SMB_PATH $MNT_PATH -o username=$STORAGE_ACCOUNT_NAME,password=$STORAGE_ACCOUNT_KEY,serverino,nosharesock,actimeo=30,mfsymlinks
