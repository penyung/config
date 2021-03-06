" Vim color file
" Maintainer:   Piotr Husiatyński <phusiatynski@gmail.com>


set background=dark
set t_Co=256
let g:colors_name="256-jungle"

let python_highlight_all = 1
let c_gnu = 1


hi Normal       ctermfg=253         ctermbg=234         cterm=None
hi Cursor       ctermfg=253         ctermbg=57          cterm=None
set cursorline
hi CursorLine   ctermfg=None        ctermbg=None        cterm=Bold
hi SpecialKey   ctermfg=70          ctermbg=None        cterm=None
hi Directory    ctermfg=57          ctermbg=254         cterm=None
hi ErrorMsg     ctermfg=160         ctermbg=245         cterm=None
hi PreProc      ctermfg=243         ctermbg=None        cterm=Bold
set hlsearch
hi Search       ctermfg=125         ctermbg=247         cterm=Bold
hi Type         ctermfg=166         ctermbg=None        cterm=Bold
hi Statement    ctermfg=172         ctermbg=None        cterm=Bold
hi Comment      ctermfg=240         ctermbg=None        cterm=None
hi LineNr       ctermfg=244         ctermbg=233         cterm=None
hi NonText      ctermfg=105         ctermbg=None        cterm=Bold
hi DiffText     ctermfg=165         ctermbg=244         cterm=None
hi Constant     ctermfg=76          ctermbg=None        cterm=None
hi Todo         ctermfg=162         ctermbg=None        cterm=Bold
hi Identifier   ctermfg=142         ctermbg=None        cterm=Bold
hi Error        ctermfg=None        ctermbg=196         cterm=Bold
"hi Special      ctermfg=172         ctermbg=None        cterm=Bold
hi Special      ctermfg=47          ctermbg=None        cterm=Bold
hi Ignore       ctermfg=221         ctermbg=None        cterm=Bold
hi Underline    ctermfg=147         ctermbg=None        cterm=Italic

hi FoldColumn   ctermfg=132         ctermbg=None        cterm=None
hi Folded       ctermfg=132         ctermbg=None        cterm=Bold

hi Visual       ctermfg=248         ctermbg=238         cterm=None

hi Pmenu        ctermfg=62          ctermbg=233         cterm=None
hi PmenuSel     ctermfg=69          ctermbg=232         cterm=Bold
hi PmenuSbar    ctermfg=247         ctermbg=233         cterm=Bold
hi PmenuThumb   ctermfg=248         ctermbg=233         cterm=None

hi StatusLineNC ctermfg=248         ctermbg=239         cterm=None
hi StatusLine   ctermfg=39          ctermbg=239         cterm=None
hi VertSplit    ctermfg=239         ctermbg=239         cterm=None

hi TabLine      ctermfg=245         ctermbg=239         cterm=None
hi TabLineFill  ctermfg=239         ctermbg=239
hi TabLineSel   ctermfg=104         ctermbg=236         cterm=Bold

hi ModeMsg      ctermfg=39          ctermbg=None        cterm=Bold

" for vimdiff color
hi DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
"vim: sw=4
" for syntax check
hi OverLength ctermbg=red ctermfg=white guibg=#592929
