# syntax=docker/dockerfile:1
FROM ubuntu
COPY --from=bitcoin-cli /bin/bitcoin-cli /usr/local/bin/bitcoin-cli
RUN \
    apt update && apt -y upgrade && \
    DEBIAN_FRONTEND=noninteractive TZ="Europe/Lisbon" apt install -y --no-install-recommends tzdata && \
    apt install -y --no-install-recommends gpg-agent software-properties-common && \
    add-apt-repository -y -u ppa:lightningnetwork/ppa && \
    apt -y install --no-install-recommends lightningd
VOLUME /root/.lightning
ENTRYPOINT ["/usr/bin/lightningd"]
