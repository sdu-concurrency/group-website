#!/bin/sh

docker run -it --rm -v "$(pwd)":/srv/jekyll -v "$(pwd)"/_docker_cache:/usr/local/bundle	jekyll/jekyll	jekyll build
