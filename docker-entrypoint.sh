#!/usr/bin/env bash
set -e
sleep 5
exec /usr/bin/lightningd "$@"
