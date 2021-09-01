function get-color
    echo (xrdb -query | grep $argv: | awk '{print $NF}' | sed 's/#//g;s/../&\//g;s/\/$//' | sed -e 's/\(.*\)/\U\1/g');
end

function update-colors-from-x --description 'Update the colors from x'
    set colors (xrdb -query | grep -Eo 'color[0-9]+:.*' | sed -e 's/color\([0-9]\):/color0\1:/g' | sort | awk '{print $NF}' | sed 's/#//g;s/../&\//g;s/\/$//' | sed -e 's/\(.*\)/\U\1/g')
    set color00 $colors[1]
    set color01 $colors[2]
    set color02 $colors[3]
    set color03 $colors[4]
    set color04 $colors[5]
    set color05 $colors[6]
    set color06 $colors[7]
    set color07 $colors[8]
    set color08 $colors[9]
    set color09 $color01;
    set color10 $color02;
    set color11 $color03;
    set color12 $color04;
    set color13 $color05;
    set color14 $color06;
    set color15 $colors[16]

    set color16 $colors[10]
    set color17 $colors[15]
    set color18 $colors[11]
    set color19 $colors[12]
    set color20 $colors[13]
    set color21 $colors[14]

    set colorfg $color07;
    set colorbg $color00;

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

    # foreground / background / cursor color
    if test -n "$ITERM_SESSION_ID"
        # iTerm2 proprietary escape codes
        put_template_custom Pg (echo $color01 | sed 's/\///g') # foreground
        put_template_custom Ph (echo $color00 | sed 's/\///g') # background
        put_template_custom Pi (echo $color01 | sed 's/\///g') # bold color
        put_template_custom Pj (echo $color19 | sed 's/\///g') # selection color
        put_template_custom Pk (echo $color01 | sed 's/\///g') # selected text color
        put_template_custom Pl (echo $color01 | sed 's/\///g') # cursor
        put_template_custom Pm (echo $color00 | sed 's/\///g') # cursor text
    else
        put_template_var 10 $colorfg
        # if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]
        #     put_template_var 11 $colorbg
        #     if string match 'rxvt*' $TERM 1>/dev/null
        #         put_template_var 708 $colorbg # internal border (rxvt)
        #     end
        # end
        put_template_custom 12 ";7" # cursor (reverse video)
    end

    # set syntax highlighting colors
    set -U fish_color_autosuggestion (echo $color19 | sed 's/\///g')
    set -U fish_color_cancel -r
    set -U fish_color_command green #white
    set -U fish_color_comment (echo $color19 | sed 's/\///g')
    set -U fish_color_cwd green
    set -U fish_color_cwd_root red
    set -U fish_color_end brblack #blue
    set -U fish_color_error red
    set -U fish_color_escape yellow #green
    set -U fish_color_history_current --bold
    set -U fish_color_host normal
    set -U fish_color_match --background=brblue
    set -U fish_color_normal normal
    set -U fish_color_operator blue #green
    set -U fish_color_param (echo $color20 | sed 's/\///g')
    set -U fish_color_quote yellow #brblack
    set -U fish_color_redirection cyan
    set -U fish_color_search_match bryellow --background=(echo $color19 | sed 's/\///g')
    set -U fish_color_selection white --bold --background=(echo $color19 | sed 's/\///g')
    set -U fish_color_status red
    set -U fish_color_user brgreen
    set -U fish_color_valid_path --underline
    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description yellow --dim
    set -U fish_pager_color_prefix white --bold #--underline
    set -U fish_pager_color_progress brwhite --background=cyan

    functions -e put_template put_template_var put_template_custom
end
