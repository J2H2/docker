#!/bin/bash
set -eo pipefail

make install

exec "$@"
