#!/bin/sh

BASEDIR=$(dirname "$0")
docker build -t manager:latest -f "$BASEDIR/Dockerfile" $BASEDIR