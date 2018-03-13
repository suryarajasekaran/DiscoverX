#!/bin/sh

BASEDIR=$(dirname "$0")
docker build -t frontend:latest -f "$BASEDIR/Dockerfile" $BASEDIR