#!/usr/bin/env fish

function update-colors-from-x -d "Update the colors from x"
    set color00 (xrdb -query | grep color0 | awk '{print $NF}')
    set color01 (xrdb -query | grep color1 | awk '{print $NF}')
    set color02 (xrdb -query | grep color2 | awk '{print $NF}')
    set color03 (xrdb -query | grep color3 | awk '{print $NF}')
    set color04 (xrdb -query | grep color4 | awk '{print $NF}')
    set color05 (xrdb -query | grep color5 | awk '{print $NF}')
    set color06 (xrdb -query | grep color6 | awk '{print $NF}')
    set color07 (xrdb -query | grep color7 | awk '{print $NF}')
    set color08 (xrdb -query | grep color8 | awk '{print $NF}')
    set color09 (xrdb -query | grep color1 | awk '{print $NF}')
    set color10 (xrdb -query | grep color2 | awk '{print $NF}')
    set color11 (xrdb -query | grep color3 | awk '{print $NF}')
    set color12 (xrdb -query | grep color4 | awk '{print $NF}')
    set color13 (xrdb -query | grep color5 | awk '{print $NF}')
    set color14 (xrdb -query | grep color6 | awk '{print $NF}')
    set color15 (xrdb -query | grep color15 | awk '{print $NF}')

    set color16 (xrdb -query | grep color9 | awk '{print $NF}')
    set color17 (xrdb -query | grep color14 | awk '{print $NF}')
    set color18 (xrdb -query | grep color10 | awk '{print $NF}')
    set color19 (xrdb -query | grep color11 | awk '{print $NF}')
    set color20 (xrdb -query | grep color12 | awk '{print $NF}')
    set color21 (xrdb -query | grep color13 | awk '{print $NF}')

    set colorfg (xrdb -query | grep color15 | awk '{print $NF}')
    set colorbg (xrdb -query | grep color0 | awk '{print $NF}')
end
