#!/usr/bin/env sh

I3_DIR=$(realpath "${HOME}/.config/i3")
I3_CONFIG=$(realpath "${I3_DIR}/config")
I3_STATUS_CONFIG=$(realpath "${I3_DIR}/status")
I3_CONFIG_DIR=$(realpath "${I3_DIR}/config.d")
I3_STATUS_CONFIG_DIR=$(realpath "${I3_DIR}/status.d")

FORMAT_STRING="# This is an auto generated file. Do not modify.\n"

if [ -d $I3_CONFIG_DIR ]; then
    echo $FORMAT_STRING > $I3_CONFIG
    cat $I3_CONFIG_DIR/* >> $I3_CONFIG
    cat $I3_STATUS_CONFIG_DIR/* >> $I3_STATUS_CONFIG
fi

COLOR_SCHEME=atelier-Sulphurpool
BRIGHTNESS=dark

if hash base16-builder 2>/dev/null ; then
    # Load scheme
    base16-builder -t i3 -s $COLOR_SCHEME -b $BRIGHTNESS >> $I3_CONFIG
    sed -i 's/bar\s*{\s*/bar {\n status_command i3blocks/g' $I3_CONFIG
    base16-builder -t i3status -s $COLOR_SCHEME -b $BRIGHTNESS >> $I3_STATUS_CONFIG
fi
