#!/usr/bin/env bash
# Headless self-test (no window). Needs imported assets.
set -euo pipefail
cd "$(dirname "$0")/.."
: "${HCC_PREFIX:=/usr/local}"
: "${HCC:=$HCC_PREFIX/bin/hcc}"
mkdir -p build
"$HCC" -O -Werror --install-dir="$HCC_PREFIX" app/test.HC -o build/selftest
./build/selftest
