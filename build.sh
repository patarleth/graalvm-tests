#!/usr/bin/env bash

BUILD_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOCKER_BUILD_DIR="${BUILD_SCRIPT_DIR}/docker"

docker_build() {
    if [ ! -f "${BUILD_SCRIPT_DIR}/target/classes" ]; then
        mkdir -p "${BUILD_SCRIPT_DIR}/target/classes"
    fi
    docker build -f "${DOCKER_BUILD_DIR}/Dockerfile" -t graalvm-tests "${BUILD_SCRIPT_DIR}"
}

docker_run() {
    docker run --rm -t -i graalvm-tests "$@"
}

docker_bash() {
    docker_run /opt/lib.sh
}
               

docker_build
docker_bash
