#!/usr/bin/env bash

set -e

. ${JTOOLS_PATH}/colors.sh

if [ -z "$VENV" ]
then
    VENV_NAME=".env"
fi

echo "`pwd`/$VENV_NAME"
if [ -d "`pwd`/$VENV_NAME" ]
then
	print "${C_YELLOW}Environment is already exist."
else
	print "${C_RED}Create virtualenv '$VENV_NAME'"
	python2 -m virtualenv -p python2 `pwd`/${VENV_NAME}
fi

if [ -f "`pwd`/requirements.txt" ]
then
	print "${C_RED}Install requirements"
	${VENV_NAME}/bin/python2 -m pip install -r requirements.txt
fi
