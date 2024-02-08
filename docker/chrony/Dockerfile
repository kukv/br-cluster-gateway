FROM alpine:latest

RUN apk add --no-cache chrony tzdata

COPY docker-entrypoint.sh /opt/docker-entrypoint.sh
COPY chrony.conf /etc/chrony/chrony.conf

EXPOSE 123/udp

HEALTHCHECK CMD chronyc tracking || exit 1

ENTRYPOINT [ "/bin/sh", "/opt/docker-entrypoint.sh" ]
