#!/bin/bash
# Copyright (c) General Electric Company, 2017.  All rights reserved.

echo ""
echo "Removing algorithm container."
docker rm rt106_algorithmtemplate_1

echo ""
echo "Removing algorithm image."
docker rmi rt106/rt106-algorithm-sdk-cuda

echo ""
echo "Building algorithm image."
docker build -t rt106/rt106-algorithm-sdk-cuda --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy -f Dockerfile-cuda .

echo ""
docker images
