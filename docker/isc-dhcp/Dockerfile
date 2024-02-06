FROM alpine:latest

# set UID/GID for dhcp
ENV UID=9067 \
    GID=9067

# add user dhcp
RUN addgroup -g $GID -S dhcp && \
    adduser --disabled-password --gecos "" --shell /sbin/nologin \
            --home /var/lib/dhcp --no-create-home --ingroup dhcp \
            --uid $UID dhcp

# add isc-dhcp-server
RUN apk add --no-cache dhcp tzdata && \
    mkdir -p /var/lib/dhcp && \
    touch /var/lib/dhcp/dhcpd.conf && \
    touch /var/lib/dhcp/dhcpd.leases

VOLUME /etc/dhcp

# set permissions for DHCPD
RUN chown -R "${UID}":"${GID}" /etc/dhcp && \
    chmod -R 0644 /etc/dhcp && \
    chown -R "${UID}":"${GID}" /var/lib/dhcp && \
    chmod -R 0644 /var/lib/dhcp

# add docker-entrypoint.sh
COPY ./docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]

HEALTHCHECK --interval=5s --timeout=10s --retries=3 \
CMD ps | grep dhcpd | grep -v grep || exit 1
