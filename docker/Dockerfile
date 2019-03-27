FROM alpine as Source

WORKDIR /

RUN apk update
RUN echo "UPDATE"
RUN apk upgrade
RUN echo "UPGRADE"
RUN apk add git openssh
RUN echo "INSTALLED GIT"
RUN ssh -vT git@github.com
RUN echo "KEYS"
RUN git clone --depth=1 https://github.com/fmontesi/group-website.git /git
RUN echo "CLONE"

FROM ruby as Build
COPY --from=Source /git/web /srv/jekyll
WORKDIR /srv/jekyll
RUN bundle install
RUN bundle exec jekyll build
RUN mv /srv/jekyll/_site /site

FROM jolielang/leonardo
ENV LEONARDO_WWW /web
COPY --from=Build /site $LEONARDO_WWW
