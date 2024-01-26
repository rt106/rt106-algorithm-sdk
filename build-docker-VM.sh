#!/bin/bash

docker build  -f Dockerfile.VM  \
              --build-arg http_proxy=$http_proxy \
              --build-arg https_proxy=$https_proxy \
              --build-arg no_proxy=$no_proxy \
              -t rt106/rt106-algorithm-sdk:latest .


