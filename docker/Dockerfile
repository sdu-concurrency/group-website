FROM alpine as Source

WORKDIR /

RUN apk update && \
		apk add git
RUN git clone --depth=1 https://github.com/fmontesi/group-website.git /git

FROM jekyll/jekyll as Build
COPY --from=Source /git/web /srv/jekyll
RUN chown -R jekyll:jekyll /srv/jekyll
RUN bundle update
RUN jekyll build
RUN mv /srv/jekyll/_site /site

FROM jolielang/leonardo
ENV LEONARDO_WWW /web
COPY --from=Build /site $LEONARDO_WWW
