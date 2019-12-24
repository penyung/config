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
"set laststatus=0
"set statusline=[%n]\ %<%F\ %((%1*%M%*%R%Y)%)\ %=%-19(\LINE\ [%3l/%3L]\ COL\ [%02c%03V]%)\ [%{&ff},%{&fileencoding},%Y]\ %P\ ascii[%02b]
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
  au BufRead,BufNewFile *.log    set filetype=log
  au BufRead,BufNewFile *.fbs    set filetype=fbs
augroup END

" makefile need tab
autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=0
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab fdm=indent
autocmd FileType tablegen setlocal foldmarker={,} fdm=marker
autocmd FIleType log match

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

" press \l to highlight current line
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" for opening the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" for opening the definition in a vertical split. But alt-key doesn't work
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" ----------------- Vundle plugin ------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" If F3 and F4 doesn't work for autotags, change terminal settings to XTERM in putty
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

" for auto completion
Plugin 'Valloric/YouCompleteMe'
" too lag for llvm, disable it
"let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
map <F9> :YcmCompleter FixIt<Enter><C-w>j
let g:ycm_filetype_blacklist = {
   \ 'log' : 1,
   \}
let g:ycm_filetype_specific_completion_to_disable = {
  \}
" auto close preview window
let g:ycm_autoclose_preview_window_after_insertion = 1
" ycm will have completion when input comments
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" change to debug to see more debug info
let g:ycm_log_level = 'info'
" key binding for YcmCompleter. Use tag importer to leverage
" tag stack
nnoremap <C-j> :TagImposterAnticipateJump <Bar> YcmCompleter GoToDeclaration<CR>
nnoremap <C-k> :TagImposterAnticipateJump <Bar> YcmCompleter GoToDefinition<CR>
" FIXME: this command has errors, but it is still usable.
nnoremap <C-l> :TagImposterAnticipateJump <Bar> YcmCompleter GoToInclude<CR>

" for quickly search file
Plugin 'eparreno/vim-l9'
Plugin 'seudut/FuzzyFinder'

" for grep integration with vim. Use :grep <pattern> <file> to do grep and
" :copen to jump to lines for pattern and file
Plugin 'yegappan/grep'

" for markdown file
Plugin 'vim-pandoc/vim-pandoc-syntax'
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" for highlight several words in different colors
Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-mark'

" for load local vimrc
Plugin 'embear/vim-localvimrc'
let g:localvimrc_ask = 0

" for indentline
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = ' '
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileType = ['python']

" for syntax check (python, shell script only)
Plugin 'vim-syntastic/syntastic'
let g:syntastic_python_checkers = ['pycodestyle']
let g:syntastic_sh_checkers = ['shellcheck', 'sh']
let g:syntastic_ignore_files = ['.ycm_extra_conf.py']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ["python", "sh"] }

"for source explorer
Plugin 'wesleyche/SrcExpl'
" The switch of the Source Explorer
nmap <F10> :SrcExplToggle<CR>

" Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"

" Set "<F5>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F5>"

" Set "<F6>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F6>"

" Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
"
"" Set "Enter" key to jump into the exact definition context
"let g:SrcExpl_jumpKey = "<ENTER>"
""
"" Set "Space" key for back from the definition context
"let g:SrcExpl_gobackKey = "<SPACE>"

" In order to avoid conflicts, the Source Explorer should know what plugins
" except itself are using buffers. And you need add their buffer names into
" below listaccording to the command ":buffers!"
"let g:SrcExpl_pluginList = [
"        \ "__Tag_List__",
"        \ "_NERD_tree_"
"    \ ]

" Enable/Disable the local definition searching, and note that this is not
" guaranteed to work, the Source Explorer doesn't check the syntax for now.
" It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

Plugin 'vim-scripts/AnsiEsc.vim'

" For insert YcmCompleter goto into tagstack, then I can use <C+t> to jump
" back to origin place
Plugin 'idbrii/vim-tagimposter'

" For easily modify surroundings pairs, such as "Hello world!" --> 'Hello world!'
" Use cs"'
Plugin 'tpope/vim-surround'

" For file system explorer. Use :NERDTree
Plugin 'scrooloose/nerdtree'

" For better status/tabline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1

" For git command in vim, such as :Gblame for git blame current file in vim
Plugin 'tpope/vim-fugitive'

call vundle#end()

if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
syntax on

" file is larger than 10mb
"let g:LargeFile = 1024 * 1024 * 100
"augroup LargeFile
" autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
"augroup END

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
