#!/bin/sh

docker run -it --rm \
    -v "$(pwd)"/web:/srv/jekyll \
    -v "$(pwd)"/.docker-cache:/usr/local/bundle \
    jekyll/jekyll:4.2.0 \
    jekyll build
