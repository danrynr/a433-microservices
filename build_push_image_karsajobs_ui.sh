#!/bin/bash

# Create docker image
docker build -t karsajobs-ui:latest .

# Change the tag of the image to the github packages format
docker tag karsajobs-ui:latest ghcr.io/danrynr/karsajobs-ui:latest

# Login to github packages
# !!!!Please change github token(classic) to your own token!!!!
export CR_PAT_FE=token # Replace token with your own token

echo $CR_PAT_FE | docker login ghcr.io -u danrynr --password-stdin

# Push docker image to github packages
docker push ghcr.io/danrynr/karsajobs-ui:latest