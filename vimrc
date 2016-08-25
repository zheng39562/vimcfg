" \file vimrc config file.
"
" \author zheng39562@163.com
" \version: 1.0.0
"
" \note I use block to split settings.Example:coding settings only set syntax of coding.
" \note code comments explains code of next line.
" \note Be attention: don't use map.Because map is recursion 


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
Bundle 'minibufexplorerpp'
Bundle 'kien/ctrlp.vim'
"Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'itchyny/lightline.vim'
"Plugin 'hallison/vim-markdown'
Bundle 'scrooloose/nerdtree'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'ervandew/supertab'
"Plugin 'kshenoy/vim-signature'
"Plugin 'majutsushi/tagbar'
"Plugin 'honza/vim-snippets'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'vim-scripts/OmniCppComplete'
Bundle 'tomasr/molokai'
"Plugin 'vim-scripts/vcscommand.vim'

"
" Vundle
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" header
"
run plugin/my.vim

syntax on                  " syntax hightlighting.

filetype plugin on

let mapleader = "-"
let maplocalleader = ","

"
" header
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 
"
set number
set wrap
set laststatus=2           
set hls
set incsearch
set foldenable               

if version >= 603
    set helplang=en
    set encoding=utf-8
endif

" shiftwidth,tab,...
set shiftwidth=4
set softtabstop=4
set tabstop=4

" encodings
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=cp936
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

"
"
" set
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap
"
"
noremap <F1> <esc>
noremap <F2> <esc>
noremap <F3> <esc>
noremap <F4> <esc>
noremap <F5> <esc>
noremap <F6> <esc>
noremap <F7> :bp<cr>
noremap <F8> :bn<cr>
noremap <F9> <esc>:NERDTreeToggle<CR>
noremap <F10> <esc>
noremap <F11> <esc>
noremap <F12> <esc>:NERDTreeToggle<CR>

noremap <leader>q <esc>:wqa<cr>
"
" noremap
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap
"
nnoremap <leader>/ :nohl<CR>

nnoremap <leader>ev : vi $MYVIMRC<cr>
nnoremap <leader>sv : source $MYVIMRC<cr>
nnoremap <leader>c <esc>viwy

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

"
" nnoremap
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap
"
inoremap jk <esc> 

"
" inoremap
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vnoremap
"
vnoremap jk <esc> 
"
" vnoremap
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup
"
augroup Global_settings
	autocmd!
    autocmd InsertLeave * se nocul
    autocmd InsertEnter * se cul        
augroup END

augroup SetMyFileType
	autocmd!
    autocmd BufNewFile,BufRead (*.(c|h|hpp)) setfiletype=corplus
augroup END

augroup C_and_CPP_Group
	autocmd!
    "autocmd BufNewFile,BufRead *.c,*.h setfiletype c
    autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp setfiletype cpp
    " SetTitle function: Add file contents automatically
    autocmd BufNewFile *.hpp,*.cpp,*.h,*.c execute ":call SetTitle()"
    autocmd BufNewFile *.hpp,*.h execute ":call DefineHeadFile()"
    autocmd BufNewFile *.cpp,*.c execute ":call DefineCppFile()"

    autocmd FileType c,cpp :iabbrev if if(){<CR>;<CR>}<esc>kk0f(a
    autocmd FileType c,cpp :iabbrev for for(){<CR>;<CR>}<esc>kk0f(a
    autocmd FileType c,cpp :iabbrev while while(){<CR>;<CR>}<esc>kk0f(a
    autocmd FileType c,cpp :iabbrev printf printf("");<esc>0f"a
    autocmd FileType c,cpp :set omnifunc=ccomplete#Complete;
    autocmd FileType c,cpp :set omnifunc=omni#cpp#complete#Main
augroup END	

"
" augroup
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : cscope
"
" used quickfix to display cscope
"set cscopequickfix=s-,c-,d-,i-,t-,e-
" used to add cscope.out
"set nocscopeverbose
"
" plugin : cscope
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : minibufexplorerpp
"
" MiniBufExplorer
" Settings(it is used to solve error of many window.
"let g:miniBufExplorerMoreThanOne = 0
" C-Tab <- | C-S-Tab ->
"let g:miniBufExplMapCTabSwitchBufs=1
" C-hjkl
"let g:miniBufExplMapWindowNavVim=1
" C-'->/<-'
"let g:miniBufExplMapWindowNavArrows=1
" Add Winmanager
"let g:winManagerWindowLayout='FileExplorer'

"
" plugin : minibufexplorerpp
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : molokai
"
if !has('gui_running')
    set t_Co=256
endif
colorscheme molokai
set laststatus=2
"
" plugin : molokai
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


