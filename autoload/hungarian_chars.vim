" hungarian_chars.vim - Useful functions for special Hungarian characters
" Author:  Peter Simon <simonpepe@gmail.com>
" Version: 1.0
" License: Same as Vim itself. See :help license

" Internal functions {{{

    function! s:ReplaceChars(replacements, firstLine, lastLine)
        for lineno in range(a:firstLine, a:lastLine)
            let lineContent = getline(lineno)
            for [pattern, replacement] in a:replacements
                let lineContent = substitute(lineContent, '\C' . pattern, replacement, 'ge')
            endfor

            call setline(lineno, lineContent)
        endfor
    endfunction

" }}}


" Public stuff {{{

                                    " Fix charaters like õ, û
    function! hungarian_chars#FixSpecialHungarianChars() range
        let replacements = [
\           [ 'õ', 'ő' ], [ 'û', 'ű' ], [ 'Õ', 'Ő' ], [ 'Û', 'Ű' ], [ 'ü', 'ü' ],
\           [ 'Ü', 'Ü' ], [ 'ú', 'ú' ], [ 'Ú', 'Ú' ], [ 'í', 'í' ], [ 'Í', 'Í' ],
\           [ 'á', 'á' ], [ 'Á', 'Á' ], [ 'é', 'é' ], [ 'É', 'É' ], [ 'ö', 'ö' ],
\           [ 'Ö', 'Ö' ], [ 'ő', 'ő' ], [ 'Ő', 'Ő' ], [ 'ó', 'ó' ], [ 'Ó', 'Ó' ],
\           [ 'ű', 'ű' ], [ 'Ű', 'Ű' ]
\       ]

        call <SID>ReplaceChars(replacements, a:firstline, a:lastline)
    endfunction

                                    " Replace special hungarian letters
    function! hungarian_chars#TransliterateSpecialHungarianChars() range
        let replacements = [
\           [ 'í', 'i' ], [ '[öőó]', 'o' ], [ '[üűú]', 'u' ], [ 'é', 'e' ],
\           [ 'á', 'a' ], [ 'Í', 'I' ], [ '[ÖŐÓ]', 'O' ], [ '[ÜŰÚ]', 'U' ],
\           [ 'É', 'E' ], [ 'Á', 'A' ],
\       ]

        call <SID>ReplaceChars(replacements, a:firstline, a:lastline)
    endfunction

" }}}
