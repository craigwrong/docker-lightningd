# syntax=docker/dockerfile:1
FROM ubuntu
COPY --from=bitcoin-cli /bin/bitcoin-cli /usr/local/bin/bitcoin-cli
RUN \
    apt-get update && apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive TZ="Europe/Lisbon" apt-get install -y --no-install-recommends tzdata gosu && \
    apt-get install -y --no-install-recommends gpg-agent software-properties-common && \
    add-apt-repository -y -u ppa:lightningnetwork/ppa && \
        apt-get -y install --no-install-recommends lightningd
COPY docker-entrypoint.sh /root/bin/
VOLUME /root/.lightning
ENTRYPOINT ["/root/bin/docker-entrypoint.sh"]
