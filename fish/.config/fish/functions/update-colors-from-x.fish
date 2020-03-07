function update-colors-from-x --description 'Update the colors from x'
    set color00 (xrdb -query | grep color0 | awk '{print $NF}');
    set color01 (xrdb -query | grep color1 | awk '{print $NF}');
    set color02 (xrdb -query | grep color2 | awk '{print $NF}');
    set color03 (xrdb -query | grep color3 | awk '{print $NF}');
    set color04 (xrdb -query | grep color4 | awk '{print $NF}');
    set color05 (xrdb -query | grep color5 | awk '{print $NF}');
    set color06 (xrdb -query | grep color6 | awk '{print $NF}');
    set color07 (xrdb -query | grep color7 | awk '{print $NF}');
    set color08 (xrdb -query | grep color8 | awk '{print $NF}');
    set color09 (xrdb -query | grep color1 | awk '{print $NF}');
    set color10 (xrdb -query | grep color2 | awk '{print $NF}');
    set color11 (xrdb -query | grep color3 | awk '{print $NF}');
    set color12 (xrdb -query | grep color4 | awk '{print $NF}');
    set color13 (xrdb -query | grep color5 | awk '{print $NF}');
    set color14 (xrdb -query | grep color6 | awk '{print $NF}');
    set color15 (xrdb -query | grep color15 | awk '{print $NF}');

    set color16 (xrdb -query | grep color9 | awk '{print $NF}');
    set color17 (xrdb -query | grep color14 | awk '{print $NF}');
    set color18 (xrdb -query | grep color10 | awk '{print $NF}');
    set color19 (xrdb -query | grep color11 | awk '{print $NF}');
    set color20 (xrdb -query | grep color12 | awk '{print $NF}');
    set color21 (xrdb -query | grep color13 | awk '{print $NF}');

    set colorfg (xrdb -query | grep color15 | awk '{print $NF}');
    set colorbg (xrdb -query | grep color0 | awk '{print $NF}');

    if test -n "$TMUX"
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        function put_template; printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $argv; end;
        function put_template_var; printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $argv; end;
        function put_template_custom; printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $argv; end;
    else if string match 'screen*' $TERM # [ "${TERM%%[-.]*}" = "screen" ]
        # GNU screen (screen, screen-256color, screen-256color-bce)
        function put_template; printf '\033P\033]4;%d;rgb:%s\007\033\\' $argv; end;
        function put_template_var; printf '\033P\033]%d;rgb:%s\007\033\\' $argv; end;
        function put_template_custom; printf '\033P\033]%s%s\007\033\\' $argv; end;
    else if string match 'linux*' $TERM # [ "${TERM%%-*}" = "linux" ]
        function put_template; test $1 -lt 16 && printf "\e]P%x%s" $1 (echo $2 | sed 's/\///g'); end;
        function put_template_var; true; end;
        function put_template_custom; true; end;
    else
        function put_template; printf '\033]4;%d;rgb:%s\033\\' $argv; end;
        function put_template_var; printf '\033]%d;rgb:%s\033\\' $argv; end;
        function put_template_custom; printf '\033]%s%s\033\\' $argv; end;
    end

    # 16 color space
    put_template 0  $color00
    put_template 1  $color01
    put_template 2  $color02
    put_template 3  $color03
    put_template 4  $color04
    put_template 5  $color05
    put_template 6  $color06
    put_template 7  $color07
    put_template 8  $color08
    put_template 9  $color09
    put_template 10 $color10
    put_template 11 $color11
    put_template 12 $color12
    put_template 13 $color13
    put_template 14 $color14
    put_template 15 $color15
    # 256 color space
    put_template 16 $color16
    put_template 17 $color17
    put_template 18 $color18
    put_template 19 $color19
    put_template 20 $color20
    put_template 21 $color21

end
