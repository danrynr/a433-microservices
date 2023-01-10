#!/bin/bash

# Create docker image
docker build -t karsajobs:latest .

# Change the tag of the image to the github packages format
docker tag karsajobs:latest ghcr.io/danrynr/karsajobs:latest

# Login to github packages
# !!!!Please change github token(classic) to your own token!!!!
export CR_PAT_BE=token # Replace token with your own token

echo $CR_PAT_BE | docker login ghcr.io -u danrynr --password-stdin

# Push docker image to github packages
docker push ghcr.io/danrynr/karsajobs:latest