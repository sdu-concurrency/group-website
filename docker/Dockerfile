FROM alpine as Source

WORKDIR /

RUN apk update
RUN apk upgrade
RUN apk add git
RUN ssh -vT git@github.com
RUN git clone --depth=1 https://github.com/fmontesi/group-website.git /git

FROM ruby as Build
COPY --from=Source /git/web /srv/jekyll
WORKDIR /srv/jekyll
RUN bundle install
RUN bundle exec jekyll build
RUN mv /srv/jekyll/_site /site

FROM jolielang/leonardo
ENV LEONARDO_WWW /web
COPY --from=Build /site $LEONARDO_WWW
