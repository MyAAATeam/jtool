#!/usr/bin/env bash


if [ -z "$JTOOLS_PATH" ]
then
    SCRIPT_PATH="`dirname \"$0\"`"
    export JTOOLS_PATH="$SCRIPT_PATH"
    CMD="$1"
else
    SCRIPT_PATH="${JTOOLS_PATH}"
    CMD="jt"
fi

SCRIPTS="${SCRIPT_PATH}/scripts"

. ${SCRIPT_PATH}/colors.sh
. ${SCRIPT_PATH}/functions.sh


function jtools {
    if [ $# -eq 0 ]
    then
        print "${C_BOLD_RED}USAGE: ${C_RESET}$0 SCRIPT_NAME [...args]"
        print
        print "${C_GREEN}Available scripts:"
        for script in ${SCRIPTS}/*
        do
            script_name="`basename $script .sh`"
            print "${C_RED} - ${C_RESET}$script_name"
        done
    else
        print "${C_BOLD_RED}Execute:${C_RESET} '${C_GREEN}$1${C_RESET}'${C_BOLD_RED} with args: ${C_RESET} '${C_GREEN}${@:2}${C_RESET}'\n"

        sh ${SCRIPTS}/$1.sh ${@:2}
    fi
}


alias jt=jtools