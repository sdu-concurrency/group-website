FROM alpine as Source

WORKDIR /

RUN apk update
RUN apk upgrade
RUN apk add wget
RUN wget https://github.com/fmontesi/group-website/archive/master.zip
RUN unzip master.zip
RUN rm master.zip
RUN mv group-website-master git

FROM ruby as Build
COPY --from=Source /git/web /srv/jekyll
WORKDIR /srv/jekyll
RUN bundle install
RUN bundle exec jekyll build
RUN mv /srv/jekyll/_site /site

FROM jolielang/leonardo
ENV LEONARDO_WWW /web
COPY --from=Build /site $LEONARDO_WWW