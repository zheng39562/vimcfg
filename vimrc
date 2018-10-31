" \file vimrc config file.
"
" \author zheng39562@163.com
" \version: 1.0.0
"
" \note I use block to split settings.Example:coding settings only set syntax of coding.
" \note code comments explains code of next line.
" \note Be attention: don't use map.Because map is recursion 

set term=screen

set nocompatible              " be iMproved  
filetype off                  " required!  
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"

call plug#begin('~/.vim/plugged')
set rtp+=~/.vim/plugged/

" vim base plugin
Plug 'vim-scripts/L9'  

Plug 'zheng39562/frvim'
Plug 'vim-scripts/A.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/molokai'
Plug 'Yggdroot/LeaderF'
Plug 'mileszs/ack.vim'
Plug 'ludovicchabant/vim-gutentags'	" tag 后台异步更新
Plug 'mhinz/vim-signify'	 " git diff 工具.

"Plug 'AsyncRun'	" 异步编译.
"Plug 'w0rp/ale'	" 动态检查
"vim-multiple-cursors
"clang_complete
"vim-javacomplete2
"Plug 'vim-scripts/gdbmgr'
"Plug 'itchyny/lightline.vim'
"Plug 'hallison/vim-markdown'
"Plug 'jiangmiao/auto-pairs'
"Plug 'kshenoy/vim-signature'
"Plug 'honza/vim-snippets'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'vim-scripts/OmniCppComplete'
"Plug 'vim-scripts/vcscommand.vim'
"Plug 'ervandew/supertab'
"vim-gitgutter
"EasyMotion
"completor.vim

call plug#end()

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" replace method
" args **/*.txt	(当前以及当前的子目录)
" argdo %s/xxx/yyy/g | update

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my variables
"
"

filetype on
filetype plugin on

syntax on                  " syntax hightlighting.

let mapleader = "-"
let maplocalleader = ","

let g:mIsIDE=0

set number
set wrap
set laststatus=2           
set hls
set incsearch
set foldenable               

" shiftwidth,tab,...
set shiftwidth=4
set softtabstop=4
set tabstop=4

" encodings
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
"set fileencoding=cp936
set fileencoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

" statusline: file name,type,path and number of line.
set statusline =FileName:%f\ \ 
set statusline +=FileType:%y\ \ 
set statusline +=Line:\ %l/%L\ \ 
set statusline +=FilePath:%.25F

set autoread
set autowrite
set nobackup
set noswapfile
set clipboard+=unnamed
set confirm
set history=1000
set linespace=0
set foldmethod=marker

set completeopt=menu,longest
set autoindent
set cindent
set noexpandtab
set smarttab
set nocp
" help iskeyword
set iskeyword+=_,$,@,%,#,-

" set option of session.
set sessionoptions-=curdir
set sessionoptions+=sesdir
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapping key 
"
"=============================================================================
noremap <F1> <esc>:A<CR>
noremap <F2> <esc>:cn<CR>
noremap <F3> <esc>:cp<CR>
noremap <F4> <esc>:LeaderfFunction!<CR>
noremap <F5> <esc>:Ack! 
noremap <F7> :bp<cr>
noremap <F8> :bn<cr>
noremap <F9> <esc>:NERDTreeToggle<CR>
noremap <F10> <esc>
noremap <F11> <esc>
noremap <F12> <esc>:NERDTreeToggle<CR>

noremap <leader>q <esc>:wqa<cr>
"=============================================================================
nnoremap <leader>ev : vi $MYVIMRC<cr>
nnoremap <leader>sv : source $MYVIMRC<cr>
nnoremap <leader>c <esc>viwy

nnoremap <c-n> <c-b>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>re <esc>viwpviwy
nnoremap <leader>p <esc>p

""""""" cscope 
nnoremap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>
"=============================================================================
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup
"
augroup Global_settings
	autocmd!
    autocmd InsertLeave * se nocul
    autocmd InsertEnter * se cul

	" autocmd VimEnter * call Initialization()
augroup END

augroup SetMyFileType
	autocmd!
    autocmd BufNewFile,BufRead (*.(c|h|hpp)) setfiletype=corplus
augroup END

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : molokai
"
if !has('gui_running')
    set t_Co=256
endif
colorscheme molokai
set laststatus=2
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : ack.vim
"
let g:ack_default_options = " --ignore-file=match:.tags"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : gutentags.vim and set tags (support universal ctags)
"
set tags=./.tags;,.tags
"
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project' ]

let g:gutentags_ctags_tagfile = '.tags'

" TODO : 此处设置的是默认的通用位置。如果多工程情况有问题。考虑在Frvim内解决掉这个问题
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = [ '--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px' ]
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
"
let g:Lf_ShortcutF = '<c-p>'

let g:Lf_RootMarkers = [ '.project', '.root', '.svn', '.git' ]
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set alt key.
"

set ttimeoutlen=30
function! Terminal_MetaMode(mode)
	set ttimeout
	if $TMUX != ''
		set ttimeoutlen=30
	elseif &ttimeoutlen > 30 || &ttimeoutlen <= 0
		set ttimeoutlen=30
	endif
	if has('nvim') || has('gui_running')
		return
	endif
	function! s:metacode(mode, key)
		if a:mode == 0
			exec "set <M-".a:key.">=\e".a:key
		else
			exec "set <M-".a:key.">=\e]{0}".a:key."~"
		endif
	endfunc
	for i in range(10)
		call s:metacode(a:mode, nr2char(char2nr('0') + i))
	endfor
	for i in range(26)
		call s:metacode(a:mode, nr2char(char2nr('a') + i))
		call s:metacode(a:mode, nr2char(char2nr('A') + i))
	endfor
	if a:mode != 0
		for c in [',', '.', '/', ';', '[', ']', '{', '}']
			call s:metacode(a:mode, c)
		endfor
		for c in ['?', ':', '-', '_']
			call s:metacode(a:mode, c)
		endfor
	else
		for c in [',', '.', '/', ';', '{', '}']
			call s:metacode(a:mode, c)
		endfor
		for c in ['?', ':', '-', '_']
			call s:metacode(a:mode, c)
		endfor
	endif
endfunc
			 
"call Terminal_MetaMode(0)


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

