FROM alpine:latest

MAINTAINER Rick van Hattem <wol.ph>

RUN apk add --no-cache \
	bash \
	tinyproxy

COPY tinyproxy.sh /opt/tinyproxy.sh

ENTRYPOINT ["/opt/tinyproxy.sh"]
