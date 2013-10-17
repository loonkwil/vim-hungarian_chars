" hungarian_chars.vim - Useful functions for special Hungarian characters
" Author:  Peter Simon <simonpepe@gmail.com>
" Version: 1.0
" License: Same as Vim itself. See :help license

" Initialization {{{

    if &compatible
        echoerr 'hungarian_chars.vim won''t work in compatible mode.'
        finish
    endif

    if exists('g:hungarian_chars_loaded')
        finish
    endif
    let g:hungarian_chars_loaded = 1

" }}}


" Helpers {{{

    function! s:SaveCursorPos()
        let s:cursorPos = getpos('.')
    endfunction

    function! s:RestoreCursorPos()
        call setpos('.', s:cursorPos)
    endfunction

" }}}


command! -range=% FixSpecialHungarianChars
\   call <SID>SaveCursorPos()<Bar>
\   <line1>,<line2>call hungarian_chars#FixSpecialHungarianChars()<Bar>
\   call <SID>RestoreCursorPos()

command! -range=% TransliterateSpecialHungarianChars
\   call <SID>SaveCursorPos()<Bar>
\   <line1>,<line2>call hungarian_chars#TransliterateSpecialHungarianChars()<Bar>
\   call <SID>RestoreCursorPos()
