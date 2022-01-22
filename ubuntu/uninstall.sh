#! /usr/bin/env bash

set -x

script=$(realpath $0)
here=$(dirname $script)

source $here/env.sh

rm $YCM
rm $CTAG_SCRIPT
