" \file vimrc config file.
"
" \author zheng39562@163.com
" \version: 1.0.0
"
" \note I use block to split settings.Example:coding settings only set syntax of coding.
" \note code comments explains code of next line.
" \note Be attention: don't use map.Because map is recursion 

set term=screen
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"
" Brief help  
" :BundleList          - list configured bundles  
" :BundleInstall(!)    - install(update) bundles  
" :BundleSearch(!) foo - search(or refresh cache first) for foo   
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles  
set nocompatible              " be iMproved  
filetype off                  " required!  

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()  

" let Vundle manage Vundle  
" *** Download vundle : git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'zheng39562/vimplugin'
Bundle 'L9'  
Bundle 'A.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/molokai'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'vim-scripts/ctrlp-funky'
Bundle 'vim-syntastic/syntastic'
"Bundle 'vim-scripts/gdbmgr'
"Bundle 'itchyny/lightline.vim'
"Bundle 'hallison/vim-markdown'
"Bundle 'jiangmiao/auto-pairs'
"Bundle 'kshenoy/vim-signature'
"Bundle 'majutsushi/tagbar'
"Bundle 'honza/vim-snippets'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'vim-scripts/OmniCppComplete'
"Bundle 'vim-scripts/vcscommand.vim'
"Bundle 'minibufexplorerpp'
"Bundle 'ervandew/supertab'

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my variables
"
"
run plugin/my.vim

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

" set default tags.
set tags+=~/base_include.tags
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapping key 
"
"=============================================================================
noremap <F1> <esc>:A<CR>
noremap <F2> <esc>:cn<CR>
noremap <F3> <esc>:cp<CR>
noremap <F4> <esc>:call UpdateTags()<CR>
noremap <F5> <esc>:execute 'CtrlPFunky ' . expand('<cword>')<CR>
noremap <F6> <esc>:CtrlPMRU<CR>
noremap <F7> :bp<cr>
noremap <F8> :bn<cr>
noremap <F9> <esc>:NERDTreeToggle<CR>
noremap <F10> <esc>
noremap <F11> <esc>
noremap <F12> <esc>:NERDTreeToggle<CR>

noremap <leader>q <esc>:wqa<cr>
"=============================================================================
nnoremap <leader>/ :nohl<CR>

nnoremap <leader>ev : vi $MYVIMRC<cr>
nnoremap <leader>sv : source $MYVIMRC<cr>
nnoremap <leader>c <esc>viwy

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
inoremap jk <esc> 
"=============================================================================
vnoremap jk <esc> 
"=============================================================================
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup
"
augroup Global_settings
	autocmd!
    autocmd InsertLeave * se nocul
    autocmd InsertEnter * se cul

	autocmd VimEnter * call Initialization()
augroup END

augroup SetMyFileType
	autocmd!
    autocmd BufNewFile,BufRead (*.(c|h|hpp)) setfiletype=corplus
augroup END

augroup C_and_CPP_Group
	autocmd!
    autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp setfiletype cpp
    autocmd BufNewFile *.hpp,*.cpp,*.h,*.c execute ":call SetTitle()"
    autocmd BufNewFile *.hpp,*.h execute ":call DefineHeadFile()"
    autocmd BufNewFile *.cpp,*.c execute ":call DefineCppFile()"

    autocmd FileType c,cpp :set omnifunc=ccomplete#Complete;
    autocmd FileType c,cpp :set omnifunc=omni#cpp#complete#Main
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
" plugin : ctrlp-funky
"
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


