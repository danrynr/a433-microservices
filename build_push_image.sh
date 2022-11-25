#!/bin/bash

# Create docker image
docker build -t item-app:v1 .

# List all docker images
docker images

# Change the tag of the image to the github packages format
docker tag item-app:v1 ghcr.io/danrynr/item-app:v1

# Login to github packages
# !!!!Please change github token(classic) to your own token!!!!
export CR_PAT=token # Replace token with your own token
echo $CR_PAT | docker login ghcr.io -u danrynr --password-stdin

# Push docker image to github packages
docker push ghcr.io/danrynr/item-app:v1