! vim: set filetype=xdefaults :

#include <...>

URxvt.keysym.Shift-Control-V: perl:clipboard:paste
URxvt.urgentOnBell: false
URxvt.iso14755: false
URxvt*scrollBar: false

URxvt.geometry: 180x50
Urxvt.perl-lib: ...
URxvt.perl-ext-common: default,matcher,tabbedex
!URxvt.perl-ext-common: default,clipboard,tabbed

URxvt.font: xft:inconsolata:size=10

! Colors
*background:   bg
*foreground:   fg
*cursorColor:  cyn

*color0:      blk
*color8:      bblk
*color1:      red
*color9:      rred
*color2:      grn
*color10:     ggrn
*color3:      ylw
*color11:     yylw
*color4:      blu
*color12:     bblu
*color5:      mag
*color13:     mmag
*color6:      cyn
*color14:     ccyn
*color7:      wht
*color15:     wwht

! ROFI Color theme
rofi.color-enabled: true
rofi.color-window: #273238, #273238, #1e2529
rofi.color-normal: #273238, #c1c1c1, #273238, #394249, #ffffff
rofi.color-active: #273238, #80cbc4, #273238, #394249, #80cbc4
rofi.color-urgent: #273238, #ff1844, #273238, #394249, #ff1844
rofi.lines: 5
rofi.borderwidth: 0
rofi.font: Source Code Pro 12
rofi.terminal: urxvt


