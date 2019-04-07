let b:baseDir=g:PATH_PLSQL_FILES
let b:bashScriptAutocompletion=g:AUTOCOMPLETE_BASH_SCRIPT


function! Complete(findstart,base)
	if a:findstart
		return FindWordStartColumn()
	else
		if DoesUserWantToSearchForFile(a:base)
			return FindMatchingFiles(a:base)
		elseif DoesUserWantsToSearchForAttrsAndMethodsOfObjectTypeOrPackage(a:base)
			return FindMatchingAttributesInFile(a:base)
		elseif DoesUserWantsToSearchForProcedureOrFunction(a:base)
			return FindParametersForProcedure(a:base)
		endif
		return ["no","match","found","for:",a:base]
	endif
endfun




function! FindWordStartColumn()
    let l:line = getline('.')
    let l:start = col('.') - 1
    while start > 0 && (l:line[l:start - 1] !~ "\\s")
    	let l:start -= 1
    endwhile
    return l:start
endfun


function! DoesUserWantToSearchForFile(userInput)
	return a:userInput !~ "\\." && a:userInput !~ "("
endfun


function! FindMatchingFiles(name)
	echo a:name
	let l:matchingFileNames = ["..."]
	let l:pathnames=split(globpath(b:baseDir,"**/*.sql"),"\\n")
	for l:filepath in l:pathnames
		let l:filename=fnamemodify(l:filepath, ':t:r')
		if l:filepath =~ a:name
			call add(l:matchingFileNames,l:filename)
		endif
	endfor
	return l:matchingFileNames
endfun



function! DoesUserWantsToSearchForAttrsAndMethodsOfObjectTypeOrPackage(userinput)
	return a:userinput =~ "\\w\\+\\.\\w*"
endfun


"corresponds to that what user entered, e.g. base_entity.enti
function! FindMatchingAttributesInFile(userInput)
	let l:dbObjectName=substitute(a:userInput,"\\(\\w\\+\\)\\.\\(\\w*\\)","\\1","g")
	let l:partOfAttribute=substitute(a:userInput,"\\(\\w\\+\\)\\.\\(\\w*\\)","\\2","g")

    let l:resultstring = system(b:bashScriptAutocompletion . ' ' . toupper(l:dbObjectName))
    let l:metadata = split(l:resultstring,";")

	let l:matchingAttributes=["..."]
	for l:attribute in l:metadata
		if toupper(l:attribute) =~ toupper(l:partOfAttribute)
			call add(l:matchingAttributes,l:dbObjectName . '.' . l:attribute)
		endif
	endfor
    return l:matchingAttributes
endfun


function! DoesUserWantsToSearchForProcedureOrFunction(userinput)
	return a:userinput =~ "\\w\\+("
endfun

function! FindParametersForProcedure(userInput)
	let l:procedureName=substitute(a:userInput,"\\(\\w\\+\\)(","\\1","g")
    let l:resultstring = system(b:bashScriptAutocompletion . ' ' . toupper(l:procedureName))
	return [l:resultstring]
endfun

