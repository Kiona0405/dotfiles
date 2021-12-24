#! /usr/bin/env bash
set -ex

here=$(dirname $0)
cd $here

source env.sh

GIT_USER=$(git config -l | grep user.name | cut -d = -f 2)
GIT_MAIL=$(git config -l | grep user.email| cut -d = -f 2)

docker build\
    --build-arg GIT_USER=GIT_USER\
    --build-arg GIT_MAIL=GIT_MAIL\
    --tag=$IMAGE .
