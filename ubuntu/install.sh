#! /usr/bin/env bash

set -e

script=$(realpath $0)
here=$(dirname $script)
source $here/env.sh

echo "---installing---"

ln -s $here/$(basename $YCM) $YCM
ln -s $here/$(basename $CTAG_SCRIPT) $CTAG_SCRIPT

echo "---successfully installed---"
