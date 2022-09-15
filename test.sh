#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
[[ ${DEBUG:-} == true ]] && set -o xtrace
readonly __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

LOCAL_NAME=datasite/test-cicd-java

echo "Running tests against ${LOCAL_NAME}"
docker run --rm -v "${__dir}/test:/home/gradle/test" -w /home/gradle/test --user gradle "${LOCAL_NAME}:latest" bash -c "ls -la;"
docker run -it --user gradle test-cicd-java-consumer:latest