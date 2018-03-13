#!/bin/sh

BASEDIR=$(dirname "$0")
docker build -t agent:latest -f "$BASEDIR/Dockerfile" $BASEDIR