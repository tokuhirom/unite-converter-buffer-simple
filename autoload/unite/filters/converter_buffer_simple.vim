let s:save_cpo = &cpo
set cpo&vim

function! unite#filters#converter_buffer_simple#define() "{{{
  return s:converter
endfunction"}}}

let s:converter = {
      \ 'name' : 'converter_buffer_simple',
      \ 'description' : 'display only filename',
      \}

function! s:converter.filter(candidates, context) "{{{
    for candidate in a:candidates
        let candidate.abbr = substitute(candidate.abbr, '\s\[.*]\s.*$', '', '')
        let candidate.abbr = substitute(candidate.abbr, '^\d+ .. ', '', '')
    endfor
  return a:candidates
endfunction"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

