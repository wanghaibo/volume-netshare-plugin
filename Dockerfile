From alpine
COPY docker-volume-netshare /bin/docker-volume-netshare
COPY docker-entrypoint.sh /docker-entrypoint.sh

#PropagatedMount Dir
RUN mkdir -p /var/lib/docker-volumes/netshare

ENV SHARE_CMD="cifs" \
    NETSHARE_SOCKET_NAME="netshare"

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
