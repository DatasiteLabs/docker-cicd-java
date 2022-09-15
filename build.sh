#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
[[ ${DEBUG:-} == true ]] && set -o xtrace
readonly __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

LOCAL_NAME=datasite/test-cicd-java
echo "Building ${LOCAL_NAME}"

docker build --no-cache --pull -t "${LOCAL_NAME}:latest" "${__dir}/"
docker build -t test-cicd-java-consumer "${__dir}/test"