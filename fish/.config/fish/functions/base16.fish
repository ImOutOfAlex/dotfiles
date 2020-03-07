function base16 --description "Switch theme"
  curl https://raw.githubusercontent.com/chriskempson/base16-xresources/master/xresources/base16-$argv.Xresources > ~/.xcolorscheme;
  xrdb -merge -I/home/alex /home/alex/.xresources;
  i3-msg reload;
end
