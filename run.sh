#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
[[ ${DEBUG:-} == true ]] && set -o xtrace
readonly __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOCKER_REPO=${1:-0.0.0.0:5001}
LOCAL_NAME=${DOCKER_REPO}/datasite/test-cicd-java
echo "Running ${LOCAL_NAME}"

docker pull "${LOCAL_NAME}:latest-java"
docker run -it --user gradle -v $(pwd):/usr/src -w /usr/src -p 8000:8000 "${LOCAL_NAME}:latest-java" bash
