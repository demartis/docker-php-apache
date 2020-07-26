#!/bin/bash

PHP_VERSION=$(echo "${DOCKER_TAG}" | cut -d "-" -f2)

if [ "${DOCKER_TAG}" == "latest" ]
then
  docker build . --build-arg PHP_VERSION="${DOCKER_TAG}" -t "${IMAGE_NAME}"
else
  docker build . --build-arg PHP_VERSION="${PHP_VERSION}" -t "${IMAGE_NAME}"
fi