#!/bin/bash

container_status=$(docker inspect -f '{{.State.Running}}' fastapi-app 2>/dev/null)

if [ "$container_status" != "true" ]; then
  echo "FastAPI container is not running. Rebuilding and starting the container..."
  
  docker build -t fastapi-chef-inspec .
  
  docker run -d -p 8000:8000 --name fastapi-app fastapi-chef-inspec

  echo "FastAPI container has been rebuilt and started."
else
  echo "FastAPI container is already running."
fi
