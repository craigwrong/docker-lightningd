#!/usr/bin/env bash
set -e
echo "Sleeping for 10 seconds while bitcoind starts."
sleep 10
echo "Starting lightningd."
exec /usr/bin/lightningd "$@"
