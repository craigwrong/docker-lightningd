#!/usr/bin/env bash
set -e
sleep 30
exec gosu /usr/bin/lightningd "$@"
