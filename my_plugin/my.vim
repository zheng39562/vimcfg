if exists("loaded_myvim")
    finish
endif
let loaded_myvim = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mIsIDE = 0
function! IsIDE()
	let absolutePath=getcwd()
	let path = finddir( "src", absolutePath )
	if ( path != "" )
		execute "! echo \"".path"\" >> temp.txt "
		g:mIsIDE = 1
	endif
	return g:mIsIDE
endfunction

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
function! InitAction()
	call IsIDE()
	if ( g:mIsIDE != 0 )
		call AddCscopeInfo()
	endif
endfunction

function! AddCscopeInfo()
	let absolutePath=getcwd()
	execute "! cscope -Rbq -I ./src 2 >> error.cs.log"
	call cs add absolutePath/cscope.out
endfunction


