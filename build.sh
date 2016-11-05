#!/bin/sh

IMAGE="mobulum/router-nginx"
VERSION="$1"
IMAGE_NAME="${IMAGE}:${VERSION}"

docker build $2 -t $IMAGE_NAME .
docker tag "$IMAGE_NAME" "${IMAGE}:latest"
docker push "${IMAGE}:latest"
docker push "${IMAGE_NAME}"
