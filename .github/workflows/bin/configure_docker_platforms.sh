#!/bin/bash

set -e

VERSION=${VERSION:-}

if [ -z "$VERSION" ] ; then
  printf 'version?\n' 1>&2
  exit 1
fi

if [ "$VERSION" = "8.1" ] || [ "$VERSION" = "9.0" ] ||[ "$VERSION" = "9.1" ] || [ "$VERSION" = "10.0" ] || [ "$VERSION" = "10.1" ] || [ "$VERSION" = "10.2" ] || [ "$VERSION" = "11.0" ] || [ "$VERSION" = "12.0" ] || [ "$VERSION" = "12.1" ] ; then
  platforms="linux/386"
elif [ "$VERSION" = "12.2" ] ; then
  platforms="linux/386,linux/arm/v4"
elif [ "$VERSION" = "13.0" ] ; then
  platforms="linux/386,linux/amd64"
elif [ "$VERSION" = "13.1" ] || [ "$VERSION" = "13.37" ] ; then
  platforms="linux/386,linux/amd64,linux/arm/v4"
elif [ "$VERSION" = "14.0" ] || [ "$VERSION" = "14.1" ] || [ "$VERSION" = "14.2" ] ; then
  platforms="linux/386,linux/amd64,linux/arm/v5"
elif [ "$VERSION" = "15.0" ] ; then
  platforms="linux/386,linux/amd64,linux/arm/v7"
else
  platforms="linux/386,linux/amd64,linux/arm64/v8"
fi

printf 'docker_platforms=%s\n' "$platforms" >> "$GITHUB_ENV"
