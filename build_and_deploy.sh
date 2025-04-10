#!/bin/bash

STACK_NAME="fastbuy"

echo "🚀 Removing existing stack '$STACK_NAME'..."
docker stack rm "$STACK_NAME"
sleep 10 # Allow some time for resources to be released

echo "🚀 Pruning unused Docker resources..."
docker system prune -af --volumes

echo "🚀 Building frontend image without cache..."
docker build --no-cache -t frontend:latest ./frontend || { echo "❌ Failed to build frontend"; exit 1; }

echo "🚀 Building backend image without cache..."
docker build --no-cache -t backend:latest ./backend || { echo "❌ Failed to build backend"; exit 1; }


echo "🚀 Building krakend image without cache..."
docker build --no-cache -t krakend:latest ./apigateway || { echo "❌ Failed to build backend"; exit 1; }

echo "🚀 Deploying stack to Docker Swarm..."
docker stack deploy -c docker-compose_swarm.yml "$STACK_NAME" || { echo "❌ Failed to deploy stack"; exit 1; }

echo "✅ Deployment completed!"
echo "🔍 Check running services with: docker stack services $STACK_NAME"
