#!/bin/bash
# This file tags and uploads an image to Docker Hub
# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath = "dsalazar10/udacity"

# Step 2:  
# Authenticate & tag
docker login
echo "Enter Image ID:"
read image_id
docker tag ${image_id} ${dockerpath}

# Step 3:
# Push image to a docker repository
docker push ${dockerpath}