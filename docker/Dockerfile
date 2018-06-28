FROM alpine as Build

WORKDIR /

RUN apk update && \
		apk add git
RUN git clone --depth=1 https://github.com/fmontesi/group-website.git /www

# Start from scratch, copy the installer, install, remove the installer.
FROM jolielang/leonardo
COPY --from=Build /www/_site /var/lib/leonardo/www
