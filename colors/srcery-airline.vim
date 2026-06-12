" Srcery
" https://srcery.sh/

let s:gui_black = "#121110"
let s:cterm_black = 0
let s:gui_red = "#EF2F27"
let s:cterm_red = 1
let s:gui_green = "#519F50"
let s:cterm_green = 2
let s:gui_yellow = "#FBB829"
let s:cterm_yellow = 3
let s:gui_blue = "#2C78BF"
let s:cterm_blue = 4
let s:gui_magenta = "#E02C6D"
let s:cterm_magenta = 5
let s:gui_cyan = "#0AAEB3"
let s:cterm_cyan = 6
let s:gui_white = "#C5B088"
let s:cterm_white = 7
let s:gui_bright_black = "#917E6B"
let s:cterm_bright_black = 8
let s:gui_bright_red = "#F75341"
let s:cterm_bright_red = 9
let s:gui_bright_green = "#98BC37"
let s:cterm_bright_green = 10
let s:gui_bright_yellow = "#FED06E"
let s:cterm_bright_yellow = 11
let s:gui_bright_blue = "#68A8E4"
let s:cterm_bright_blue = 12
let s:gui_bright_magenta = "#FF5C8F"
let s:cterm_bright_magenta = 13
let s:gui_bright_cyan = "#2BE4D0"
let s:cterm_bright_cyan = 14
let s:gui_bright_white = "#FCE8C3"
let s:cterm_bright_white = 15
let s:gui_dark_green = "#294229"
let s:cterm_dark_green = 22
let s:gui_dark_red = "#4F2321"
let s:cterm_dark_red = 88
let s:gui_dark_blue = "#1E5181"
let s:cterm_dark_blue = 24
let s:gui_dim_green = "#2E5C2E"
let s:cterm_dim_green = 0
let s:gui_orange = "#FF5F00"
let s:cterm_orange = 202
let s:gui_bright_orange = "#FF8700"
let s:cterm_bright_orange = 208
let s:gui_teal = "#008080"
let s:cterm_teal = 30
let s:gui_gray1 = "#1C1B19"
let s:cterm_gray1 = 0
let s:gui_gray2 = "#262522"
let s:cterm_gray2 = 0
let s:gui_gray3 = "#312F2C"
let s:cterm_gray3 = 0
let s:gui_gray4 = "#3B3935"
let s:cterm_gray4 = 0
let s:gui_gray5 = "#45433E"
let s:cterm_gray5 = 0
let s:gui_gray6 = "#504D47"
let s:cterm_gray6 = 0

let g:airline#themes#srcery#palette = {}

let s:N1 = [ s:gui_black, s:gui_bright_green, s:cterm_black, s:cterm_bright_green ]
let s:N2 = [ s:gui_green, s:gui_gray1,  s:cterm_bright_green, 235 ]
let s:N3 = [ s:gui_green, s:gui_black, s:cterm_bright_green, s:cterm_black ]
let g:airline#themes#srcery#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:C1 = [ s:gui_black, s:gui_cyan, s:cterm_black, s:cterm_cyan ]
let s:C2 = [ s:gui_cyan, s:gui_gray1,  s:cterm_cyan, 235 ]
let s:C3 = [ s:gui_cyan, s:gui_black, s:cterm_cyan, s:cterm_black ]
let g:airline#themes#srcery#palette.commandline = airline#themes#generate_color_map(s:C1, s:C2, s:C3)

let s:I1 = [ s:gui_black, s:gui_yellow, s:cterm_black, s:cterm_yellow ]
let s:I2 = [ s:gui_yellow, s:gui_gray1,  s:cterm_yellow, 235 ]
let s:I3 = [ s:gui_yellow, s:gui_black, s:cterm_yellow, s:cterm_black ]
let g:airline#themes#srcery#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:V1 = [ s:gui_black, s:gui_blue, s:cterm_black, s:cterm_blue ]
let s:V2 = [ s:gui_blue, s:gui_gray1,  s:cterm_blue, 235 ]
let s:V3 = [ s:gui_blue, s:gui_black, s:cterm_blue, s:cterm_black ]
let g:airline#themes#srcery#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:R1 = [ s:gui_black, s:gui_red, s:cterm_black, s:cterm_red ]
let s:R2 = [ s:gui_red, s:gui_gray1,  s:cterm_red, 235 ]
let s:R3 = [ s:gui_red, s:gui_black, s:cterm_red, s:cterm_black ]
let g:airline#themes#srcery#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:IA1 = [ s:gui_black, s:gui_gray6, s:cterm_black, 240 ]
let s:IA2 = [ s:gui_green, s:gui_gray1,  245, 235 ]
let s:IA3 = [ s:gui_green, s:gui_gray6, 245, s:cterm_black ]
let g:airline#themes#srcery#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

