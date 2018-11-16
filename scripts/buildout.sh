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
	print "${C_YELLOW}Use virtualenv '$VENV_NAME'"
else
	print "${C_RED}Create virtualenv '$VENV_NAME'"
	python2 -m virtualenv -p python2 `pwd`/${VENV_NAME}
fi

print "${C_RED}Activate virtualenv"

source ${VENV_NAME}/bin/activate

if [ -f "requirements.txt" ]
then
    print "${C_RED}Installing requirements..."
    pip2 install -r requirements.txt
fi

print "${C_RED}Bootstraping..."
python2 bootstrap.py

print "${C_RED}Make buildout"
bin/buildout -N
