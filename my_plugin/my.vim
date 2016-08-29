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
	call add( titleList, " \\!note	ע����� " )
	call add( titleList, "			1,���еĳ�Ա�����е�ͬ�������ĺ�����ȫ��ͬ������ע������һ���������������������ظ�ע�͡������Ĳ������岻ͬʱ�������ע�⡣ " )
	call add( titleList, "			2,��1���Ĺ���ͬ�������ڷ���ֵ�ĺ��塣 " )
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
		call setline( curList, "**********************************************************/" )
    else
        echom "filetype is ".&filetype
    endif

    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefineHeadFile()
	call setline( 1, "#ifndef _".expand("%:t:r")."_H" )
    call append( line(".")+1, "#define _".expand("%:t:r")."_H" )
    call append( line(".")+2, "#endif " )
    call append( line(".")+3, "" )
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


