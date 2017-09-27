set nocompatible
set nu
set autoindent
set backspace=2
set ruler
set showmode
set encoding=utf-8
set termencoding=utf-8
colorscheme 256-jungle
set expandtab
set tabstop=2
set shiftwidth=2 " for tab view
" makefile need tab
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

set laststatus=2
set statusline=[%n]\ %<%F\ %((%1*%M%*%R%Y)%)\ %=%-19(\LINE\ [%3l/%3L]\ COL\ [%02c%03V]%)\ [%{&ff},%{&fileencoding},%Y]\ %P\ ascii[%02b]

set mouse=a
set novisualbell  " don't blink

filetype on
augroup filetype
  " llvm related
  au BufRead,BufNewFile *.ll     set filetype=llvm
  au BufRead,BufNewFile *.td     set filetype=tablegen
  " other setting
  au BufRead,BufNewFile *.cl     set filetype=cpp
  au BufRead,BufNewFile *.ptx    set filetype=s
augroup END

" for vnew, split windows to right as default
set splitright

" folding
set foldmarker={,}
set foldmethod=syntax

"for inserting a single char
:nmap <Space> i <Esc>r

" for highlight the trailing space
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| if(\| for(\| switch(\| while(/
hi MyComment ctermfg=240
2match MyComment /^[\t]*## .*$/

" for examining lines that are more than 80 columns, it should be set by project
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
augroup format
  autocmd BufRead,BufNewFile /home/pyyou/llvm/* match OverLength /\%81v.\+/
augroup END

" for search visually selected text
vnoremap // y/<C-R>"<CR>"

" highlight region
syntax region region1 matchgroup=region1 start="===r1===" end="===rend==="
highlight region1 ctermfg=red guifg=red

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" If F3 and F4 doesn't work for autotags, google putty F3 to search why to change putty settings
" set g:autotags_ctags_opts for YouCompleteMe
Plugin 'basilgor/vim-autotags'
let g:autotags_ctags_opts = "--c++-kinds=+p --fields=+iaSl --extra=+q"

" for cscope key mapping
Plugin 'chazy/cscope_maps'

" for auto-pairs such as {}, "", etc
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" for showing class, function overview
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" for auto completion
Plugin 'Valloric/YouCompleteMe'
" too lag for llvm, disable it
"let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
map <F9> :YcmCompleter FixIt<CR>

" for quickly search file
Plugin 'eparreno/vim-l9'
Plugin 'seudut/FuzzyFinder'

" for grep integration with vim
Plugin 'yegappan/grep'

" for preview markdown file
Plugin 'JamshedVesuna/vim-markdown-preview'
call vundle#end()

"key mapping for ctags
map <F12> :!ctags -R --c++-kinds=+p --fields=iaS --extra=+q . <CR><CR>
nmap <C-g> :tag<CR>
