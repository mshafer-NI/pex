#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=`basename "$0"`

tox -e vendor -- --no-update
bash $SCRIPT_DIR/embed_virtual_env.sh
git diff --exit-code
