#!/usr/bin/env bash
# docker_build_and_tag.sh
set -e
IMAGE_NAME="${1:-task-analyzer-backend}"
TAG="${2:-latest}"
docker build -t ${IMAGE_NAME}:${TAG} ./backend
echo "Built ${IMAGE_NAME}:${TAG}"
echo "To push to GHCR locally (requires docker login):"
echo "  docker tag ${IMAGE_NAME}:${TAG} ghcr.io/<your-username>/${IMAGE_NAME}:${TAG}"
echo "  docker push ghcr.io/<your-username>/${IMAGE_NAME}:${TAG}"
