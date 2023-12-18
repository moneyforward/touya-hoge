#!/bin/bash

## Loads conf.env into env
set -o allexport && source ./etc/conf.env && set +o allexport

set -e
if (rm -r ./build); then
  echo "Removed './build'"
  mkdir ./build
else 
  echo "Could not remove './build'"
fi

docker run -it -v .:/usr/app -w /usr/app/src \
  $GO_DOCKER_IMG \
  bash
