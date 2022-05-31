# `lightningd` (Core Lightning) for Docker

Use this `Dockerfile` to spin off Lightning Network node instances.

## Dependencies

- Docker for Desktop
- The `bitcoin-cli` Docker image from: [Bitcoin Core for Docker](https://github.com/craigwrong/docker-bitcoin-core)

## Building the image

Refer to the _Bitcoin Core for Docker_ instructions for details on how to build the `bitcoin-cli` Docker image.

To build the `lightningd` Docker image:

    docker build -t lightningd .

## Sample run

Start an instance of `bitcoind` on `regtest` network:

    cd sandbox
    docker run --name bitcoind-regtest-1 --network bitcoin-regtest --ip 10.0.0.2 --rm -v $PWD/sample.bitcoin:/.bitcoin bitcoind

On another terminal window:

    cd sandbox
    docker run --name lightningd-regtest-1 --rm -it --network bitcoin-regtest -v $PWD/sample.lightning:/root/.lightning -v $PWD/sample.bitcoin/regtest/.cookie:/root/.bitcoin/regtest/.cookie lightningd

## Lightning CLI

We can use `lightning-cli` on the same container in which we started the daemon:

    docker exec -it lightningd-regtest-1 lightning-cli listfunds
