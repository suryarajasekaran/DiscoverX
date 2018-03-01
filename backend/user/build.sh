#!/bin/sh

BASEDIR=$(dirname "$0")
docker build -t user:latest -f "$BASEDIR/Dockerfile" $BASEDIR