#!/bin/sh

bg_color=#1C1B19
border_color=#2D2B28
text_color=#FCE8C3
htext_color=#5573A3

rofi -show run -lines 5 -eh 1 -width 20 -bw 2 -no-show-match -hide-scrollbar -color-window "$bg_color, $border_color, $bg_color" -color-normal "$bg_color, $text_color, $bg_color, $bg_color, $htext_color" -font "Consolas Regular 11"
