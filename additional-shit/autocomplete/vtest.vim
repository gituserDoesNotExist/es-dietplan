let g:testvar="te.st"





function! DoSomething()
	let l:input='base_entity('

	if l:input !~ "\\." && l:input !~ "("
		echo 'file search'
	else
		echo 'it does'
	endif

endfunction
