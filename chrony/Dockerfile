FROM alpine:latest

RUN apk add --no-cache chrony tzdata

COPY startup.sh /opt/startup.sh
COPY chrony.conf /etc/chrony/chrony.conf

EXPOSE 123/udp

HEALTHCHECK CMD chronyc tracking || exit 1

ENTRYPOINT [ "/bin/sh", "/opt/startup.sh" ]
