#!/bin/bash

echo ""
echo "Removing algorithm container."
docker rm rt106_algorithmtemplate_1

echo ""
echo "Removing algorithm image."
docker rmi rt106/rt106-algorithm-sdk

echo ""
echo "Building algorithm image."
docker build -t rt106/rt106-algorithm-sdk --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy .

echo ""
docker images
