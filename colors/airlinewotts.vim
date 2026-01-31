" airlinewotts - theme for vim-airline
let g:airline#themes#airlinewotts#palette = {}

" NORMAL
let s:N1   = [ '#585858' , '#E4E4E4' , 237  , 15 ]
let s:N2   = [ '#E4E4E4' , '#0087AF' , 237 , 7 ]
let s:N3   = [ '#EEEEEE' , '#005F87' , 15  , 0 ]
let g:airline#themes#airlinewotts#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" INSERT
let s:I1 = [ '#585858' , '#E4E4E4' , 237  , 7 ]
let s:I2 = [ '#E4E4E4' , '#i47AF00' , 237 , 15 ]
let s:I3 = [ '#EEEEEE' , '#2E8700' , 15  , 0 ]
let g:airline#themes#airlinewotts#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

" REPLACE
let s:R1 = [ '#585858' , '#E4E4E4' , 237  , 15 ]
let s:R2 = [ '#E4E4E4' , '#AF5F00' , 237 , 9 ]
let s:R3 = [ '#EEEEEE' , '#875300' , 15  , 1 ]
let g:airline#themes#airlinewotts#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" VISUAL
let s:V1 = [ '#585858' , '#E4E4E4' , 237 , 15 ]
let s:V2 = [ '#E4E4E4' , '#AF2800' , 237 , 11 ]
let s:V3 = [ '#EEEEEE' , '#872800' , 237  , 3 ]
let g:airline#themes#airlinewotts#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

" INACTIVE
let s:IA1 = [ '#585858' , '#E4E4E4' , 8 , 15 , '' ]
let s:IA2 = [ '#E4E4E4' , '#466D79' , 8 , 7 , '' ]
let s:IA3 = [ '#EEEEEE' , '#324E59' , 8 , 0 , '' ]
let g:airline#themes#airlinewotts#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" TERMINAL
let g:airline#themes#airlinewotts#palette.terminal = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#airlinewotts#palette.normal.airline_term = s:N3
let g:airline#themes#airlinewotts#palette.terminal.airline_term = s:I3
let g:airline#themes#airlinewotts#palette.visual.airline_term = s:V3

let g:airline#themes#airlinewotts#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 9 , ''  ]
      \ }

" CTRLP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#airlinewotts#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#E4E4E4' , '#00AFA2' , 15 , 37  , ''     ],
      \ [ '#EEEEEE' , '#008787' , 15  , 30 , ''     ],
      \ [ '#585858' , '#E4E4E4' , 8 , 15  , ''     ])
