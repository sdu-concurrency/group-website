FROM jekyll/jekyll:4.2.0 AS build
RUN apk update && \
    apk add graphviz

# NOTE: We don't make use of the image's `/srv/jekyll` WORKDIR because it's
# declared as a VOLUME in the `jekyll/jekyll` image. After a path is declared as
# a volume, Docker will discard any image *build-time* modifications to the
# whole tree under that path. This makes it unusable for our purposes, because
# we are calling `jekyll build` and expecting it to write to that directory at
# image build-time.
#
# For this reason, we make use of our own `/build` directory. We have to
# remember to chown the directory first in order to avoid permission errors, as
# the image wraps the `jekyll` script to explicitly run under the `jekyll` user.

COPY web/ /build
RUN chown -R jekyll:jekyll /build
WORKDIR /build
RUN jekyll build

FROM jolielang/leonardo
ENV LEONARDO_WWW /web
COPY --from=build /build/_site $LEONARDO_WWW
