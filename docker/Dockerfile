FROM jekyll/jekyll:4.2.0 AS build
RUN apk update && \
    apk add graphviz
RUN git clone --depth=1 https://github.com/sdu-concurrency/group-website.git /git
RUN mv /git/web/* /srv/jekyll
RUN jekyll build

FROM jolielang/leonardo
ENV LEONARDO_WWW /web
COPY --from=build /srv/jekyll/_site $LEONARDO_WWW
