#!/bin/bash
docker build --build-arg UID=$UID --build-arg GID=$(id --group) -t github-pages .
docker run -it --net host -v $(pwd):/blog github-pages
