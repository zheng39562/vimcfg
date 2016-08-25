if exists("loaded_myvim")
    finish
endif
let loaded_myvim = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetTitle()
    if &filetype == 'cpp'
        call setline( 1, "/**********************************************************" )
        call append( line("."), " * \\file ".expand("%:t") )
        call append( line(".")+1, " * \\brief " )
        call append( line(".")+2, " * \\note	注意事项：" )
        call append( line(".")+3, " *			1,类中的成员函数中的同名参数的含义完全相同。仅会注释其中一个函数，其他函数则不再重复注释。重名的参数意义不同时，会独立注解。" )
        call append( line(".")+4, " *			2,第1条的规则同样适用于返回值的含义。" )
        call append( line(".")+5, " * " )
        call append( line(".")+6, " * \\version " )
        call append( line(".")+7, " * \\author zheng39562@163.com" )
        call append( line(".")+8, "**********************************************************/" )
    else
        echom "filetype is ".&filetype;
    endif

    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefineHeadFile()
    call setline( 11, "#ifndef _".expand("%:t:r")."_H" )
    call append( line(".")+1, "#define _".expand("%:t:r")."_H" )
    call append( line(".")+2, "#endif " )
    call append( line(".")+3, "" )
    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefineCppFile()
    call setline( 11, "#include \"".expand("%:t:r").".h\"" )
    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CompileRun()
    execute "w"

    if &filetype == 'cpp'
        execute ""
    else
        echom "Unknow filetype.You can add new filetype"
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoSessionFile="project.vim"
let g:OriginalPWD=getcwd()
function! LeaveHandle()
    execute "mksession! ".g:OriginalPWD."/".g:AutoSessionFile
endfunction

function! EnterHandle()
    execute "source ".g:AutoSessionFile
endfunction

if filereadable(g:AutoSessionFile)
    if argc() == 0
        autocmd VimEnter * call EnterHandle()
        autocmd VimLeave * call LeaveHandle()
    endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
