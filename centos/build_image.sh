#! /usr/bin/env bash
set -ex

here=$(dirname $0)
cd $here

source env.sh

docker build --tag=$IMAGE .
