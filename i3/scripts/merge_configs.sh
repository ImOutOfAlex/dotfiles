#!/usr/bin/env sh

echo $_ > /dev/null
SCRIPT=$(readlink -f $_)
BASEDIR=$(dirname $SCRIPT)
DOTFILESDIR=$(realpath "${BASEDIR}/../..")

I3_DIR=$(realpath "${DOTFILESDIR}/i3")
I3_CONFIG=$(realpath "${I3_DIR}/config")
I3_CONFIG_DIR=$(realpath "${I3_DIR}/config.d")

FORMAT_STRING="# This is an auto generated file. Do not modify.\n"

if [ -d $I3_CONFIG_DIR ]; then
    echo $FORMAT_STRING > $I3_CONFIG
    cat $I3_CONFIG_DIR/* >> $I3_CONFIG
fi
