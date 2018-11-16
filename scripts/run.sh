#!/usr/bin/env bash

set -e

. ${JTOOLS_PATH}/colors.sh


if [[ "$1" == "pserve" ]]
then
	./bin/pserve $2 --reload & tail -f var/log/*
else
	./bin/circusd & tail -f var/log/*.log
fi
