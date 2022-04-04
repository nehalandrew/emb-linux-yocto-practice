#!/bin/bash
clear

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

readonly TARGET_HOST=root@10.42.0.30
readonly TARGET_PATH=/root
readonly SOURCE_PATH=./target/release/hello

readonly TARGET_ARCH=aarch64-unknown-linux-gnu

cargo build --release --target=${TARGET_ARCH}
scp ${SOURCE_PATH} ${TARGET_HOST}:${TARGET_PATH}

ssh ${TARGET_HOST} ./hello