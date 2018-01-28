#!/bin/bash
set -eo pipefail

command="$@"

git pull
make install

exec $command
