#!/usr/bin/env sh

I3_DIR=$(realpath "${HOME}/.i3")
I3_CONFIG=$(realpath "${I3_DIR}/config")
I3_CONFIG_DIR=$(realpath "${I3_DIR}/config.d")

FORMAT_STRING="# This is an auto generated file. Do not modify.\n"

if [ -d $I3_CONFIG_DIR ]; then
    echo $FORMAT_STRING > $I3_CONFIG
    cat $I3_CONFIG_DIR/* >> $I3_CONFIG
fi
