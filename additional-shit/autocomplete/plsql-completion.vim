let b:baseDir=g:PATH_PLSQL_FILES
let b:bashScriptAutocompletion=g:AUTOCOMPLETE_BASH_SCRIPT

function! FindMatchingFiles(name)
	echo a:name
	let l:matchingFileNames = ["hello","world"]
	let l:pathnames=split(globpath(b:baseDir,"**/*.sql"),"\\n")
	for l:filepath in l:pathnames
		let l:filename=fnamemodify(l:filepath, ':t:r')
		if l:filepath =~ a:name
			call add(l:matchingFileNames,l:filename)
		endif
	endfor
	return l:matchingFileNames
endfun

function! DoesUserWantToSearchForFile(userinput)
	if a:userinput !~ "\\."
		return 1
	endif
	return 0
endfun

function! DoesUserWantToSearchInFile(filename)
	if a:filename != "\\w\\.\\w"
		return 1
	endif
	return 0
endfun


function! FindWordStartColumn()
    let l:line = getline('.')
    let l:start = col('.') - 1
    while start > 0 && (l:line[l:start - 1] !~ "\\s")
    	let l:start -= 1
    endwhile
    return l:start
endfun

"corresponds to that what user entered, e.g. base_entity.enti
function! FindMatchingAttributesInFile(userInput)
	let l:dbObjectName=substitute(a:userInput,"\\(\\w\\+\\)\\.\\(\\w*\\)","\\1","g")
	let l:partOfAttribute=substitute(a:userInput,"\\(\\w\\+\\)\\.\\(\\w*\\)","\\2","g")

	echom 'db object name is ' . l:dbObjectName
	echom 'part of attr is ' . l:partOfAttribute

    let l:resultstring = system(b:bashScriptAutocompletion . ' ' . toupper(l:dbObjectName))
    let l:metadata = split(l:resultstring,";")

	let l:matchingAttributes=["some","result"]
	for l:attribute in l:metadata
		if toupper(l:attribute) =~ toupper(l:partOfAttribute)
			call add(l:matchingAttributes,l:dbObjectName . '.' . l:attribute)
		endif
	endfor
    return l:matchingAttributes
endfun



function! Complete(findstart,base)
	echom "base is: " . a:base
	if a:findstart
		return FindWordStartColumn()
	else
		if DoesUserWantToSearchForFile(a:base)
			return FindMatchingFiles(a:base)
		elseif DoesUserWantToSearchInFile(a:base)
			echom 'search in file'
			return FindMatchingAttributesInFile(a:base)	
		endif
		return ["nomatch",a:base]
	endif
endfun



