#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

set -e

FULL_SPEC_PATH="${SCRIPT_DIR}/${RELATIVE_SPEC_FILE_PATH}"
SPEC_FILE_PATH=$(dirname "${FULL_SPEC_PATH}")
SPEC_FILE_NAME=$(basename "${FULL_SPEC_PATH}")

YAML_SPECS="$(find "${SPEC_FILE_PATH}" -name '*.yaml')"

COUNT=0
PRIMARY=0

for SPEC in ${YAML_SPECS[@]}
do
  COUNT=$((COUNT+=1))
  URLS="${URLS},{ url: 'spec${SPEC//$SPEC_FILE_PATH/}', name: '$COUNT' }"
  if [[ "$SPEC" == "$SPEC_FILE_PATH/$SPEC_FILE_NAME" ]]; then
    PRIMARY=$COUNT
  fi
done

URLS_PRIMARY_NAME="${PRIMARY}"
URLS="[${URLS:1}]"

DOCKER_BUILDKIT=0 docker build -t "${DOCKER_IMAGE}:${GIT_SHA}" --build-arg URLS_PRIMARY_NAME="${URLS_PRIMARY_NAME}" --build-arg URLS="${URLS}" --file "${SCRIPT_DIR}/Dockerfile" "${SPEC_FILE_PATH}"

docker tag "${DOCKER_IMAGE}:${GIT_SHA}" "${DOCKER_IMAGE}:latest"