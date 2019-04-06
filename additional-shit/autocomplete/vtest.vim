let g:testvar="te.st"





function! DoSomething()
	let l:input='base_entity.someword'
	let l:dbObjectName=substitute(l:input,"\\(\\w\\+\\)\\.\\(\\w\\+\\)","\\1","g")
	let l:partOfAttribute=substitute(l:input,"\\(\\w\\+\\)\\.\\(\\w\\+\\)","\\2","g")

	echo l:dbObjectName
	echo l:partOfAttribute
endfunction
