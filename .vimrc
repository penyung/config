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
set laststatus=2
set statusline=[%n]\ %<%F\ %((%1*%M%*%R%Y)%)\ %=%-19(\LINE\ [%3l/%3L]\ COL\ [%02c%03V]%)\ [%{&ff},%{&fileencoding},%Y]\ %P\ ascii[%02b]
set mouse=a
set novisualbell  " don't blink

" for vnew, split windows to right as default
set splitright

" folding
set foldmarker={,}
set foldmethod=syntax

filetype on
augroup filetype
  " llvm related
  au BufRead,BufNewFile *.ll     set filetype=llvm
  au BufRead,BufNewFile *.td     set filetype=tablegen
  " other setting
  au BufRead,BufNewFile *.cl     set filetype=cpp
  au BufRead,BufNewFile *.ptx    set filetype=s
augroup END

" makefile need tab
autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=0
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab fdm=indent
autocmd FileType tablegen setlocal foldmarker={,} fdm=marker

" ----------------- for special highlighting --------------
" highlight region
syntax region region1 matchgroup=region1 start="===r1===" end="===rend==="
highlight region1 ctermfg=red guifg=red

" for highlight the trailing space
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| if(\| for(\| switch(\| while(/
hi MyComment ctermfg=240
2match MyComment /^[\t]*## .*$/

" ----------------- key binding --------------
" for search visually selected text
vnoremap // y/<C-R>"<CR>"

"for inserting a single char
nmap <Space> i <Esc>r

"key mapping for ctags
map <F12> :!ctags -R --c++-kinds=+p --fields=iaS --extra=+q . <CR><CR>
nmap <C-g> :tag<CR>

" press \l to highlight current line
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
" ----------------- Vundle plugin ------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" If F3 and F4 doesn't work for autotags, google putty F3 to search why to change putty settings
" set g:autotags_ctags_opts for YouCompleteMe
Plugin 'basilgor/vim-autotags'
let g:autotags_ctags_opts = "--c++-kinds=+p --fields=+iaSl --extra=+qf"
" add .td for llvm
let g:autotags_cscope_file_extensions = ".cpp .cc .cxx .m .hpp .hh .h .hxx .c .idl .java .td .inc"

" for cscope key mapping
Plugin 'chazy/cscope_maps'

" for auto-pairs such as {}, "", etc
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" for showing class, function overview
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"if $DEBIAN
  " for auto completion
  Plugin 'Valloric/YouCompleteMe'
  " too lag for llvm, disable it
  "let g:ycm_collect_identifiers_from_tags_files = 1
  let g:ycm_confirm_extra_conf = 0
  map <F9> :YcmCompleter FixIt<CR>
	let g:ycm_filetype_blacklist = {
		\ 'log' : 1,
	  \}
	let g:ycm_filetype_specific_completion_to_disable = {
		\ 'sh' : 1,
		\ 'vim' : 1,
	  \}
"endif

" for quickly search file
Plugin 'eparreno/vim-l9'
Plugin 'seudut/FuzzyFinder'

" for grep integration with vim
Plugin 'yegappan/grep'

" for preview markdown file
Plugin 'JamshedVesuna/vim-markdown-preview'

" for Highlight server words in different colors
Plugin 'vim-scripts/ingo-library'
Plugin 'inkarkat/vim-mark'

" for load local vimrc
Plugin 'embear/vim-localvimrc'
let g:localvimrc_ask = 0
call vundle#end()

if findfile("/home/RTDOMAIN/STools/RLX-RHEL6/vim-8.0.1097/share/vim/vim80/syntax/syncolor.vim")
	source /home/RTDOMAIN/STools/RLX-RHEL6/vim-8.0.1097/share/vim/vim80/syntax/syncolor.vim
endif

syntax on

" for llvm only. Replace it with a vim plugin in the future
set path+=/home/RTDOMAIN/penyung/repo-rsdk/llvm-6/include/

" file is larger than 10mb
let g:LargeFile = 1024 * 1024 * 100
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " no default syntax check
 match none
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction
