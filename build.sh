#!/bin/bash
YED_VERSION=${1:-3.17.2}
BASE=${2:-oracle_jdk}
docker build --build-arg YED_VERSION=${YED_VERSION} -f "Dockerfile.${BASE}" --rm -t "yed:${YED_VERSION}_${BASE}" .
docker tag "yed:${YED_VERSION}_${BASE}" yed:latest
