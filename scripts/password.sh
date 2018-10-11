set -e

. ${JTOOLS_PATH}/colors.sh


if [ $# -gt 1 ]
then
    username="$1"
    password="${@:2}"
else
    if [ $# -eq 1 ]
    then
        username="$1"
        password="$1"
    else
        username="test"
        password="test"
    fi
fi


print "${C_BOLD_RED}Username: '${C_GREEN}$username${C_BOLD_RED}'"
print "${C_BOLD_RED}Password: '${C_GREEN}$password${C_BOLD_RED}'"

passwordHash=`python -c "print(__import__('hashlib').sha512('$2'.encode('utf8')).hexdigest())"`

print
print "${C_GREEN}$username${C_RED} = ${C_GREEN}$passwordHash"
