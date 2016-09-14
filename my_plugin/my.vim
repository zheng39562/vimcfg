if exists("loaded_myvim")
    finish
endif
let loaded_myvim = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Initialization()
	if( IsIDE() == 1 ) 
		call UpdateCscopeInfo()
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mIsIDE = 0
function! IsIDE()
	let absolutePath=getcwd()

	let sourceNameList = [ "src", "source" ]
	for sourceName in sourceNameList
		let findDirName = finddir( sourceName, absolutePath )
		if sourceName == findDirName 
			let g:mIsIDE = 1	
		endif
	endfo

	return g:mIsIDE
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetTitle()
	let titleList = [ ]
	call add( titleList, " \\!file ".expand("%:t") )
	call add( titleList, " \\!brief" )
	call add( titleList, " \\!note	注意事项： " )
	call add( titleList, "			1,类中的成员函数中的同名参数的含义完全相同。仅会注释其中一个函数，其他函数则不再重复注释。重名的参数意义不同时，会独立注解。 " )
	call add( titleList, "			2,第1条的规则同样适用于返回值的含义。 " )
	call add( titleList, "" )
	call add( titleList, "\\!version " )
	call add( titleList, "* \\!author zheng39562@163.com" )

    if &filetype == 'cpp'
		let curList = 1
		call setline( curList, "/**********************************************************" )

		for title in titleList 
			let curList = curList + 1
			call setline( curList, " * ".title )
		endfor 
		call setline( curList + 1, "**********************************************************/" )
		call setline( curList + 2, "" )
    else
        echom "filetype is ".&filetype
    endif

    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefineHeadFile()
    execute ":normal! G$"
	call setline( line("."), "#ifndef _".expand("%:t:r")."_H" )
    call setline( line(".")+1, "#define _".expand("%:t:r")."_H" )
    call setline( line(".")+2, "#endif " )
    call setline( line(".")+3, "" )
    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefineCppFile()
    call setline( 11, "#include \"".expand("%:t:r").".h\"" )
    silent execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UpdateCscopeInfo()
	let absolutePath=getcwd()
	silent! execute "! cscope -Rbq -I ".absolutePath."/src 2>>error.cs.log" 
	silent! execute "cs add ".absolutePath."/cscope.out"
endfunction

function! UpdateTags()
	silent! execute "! find . -iname '*.c' -or -iname '*.cpp' -or -iname '*.hpp' -or -iname '*.h' | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl tags "
endfunction


