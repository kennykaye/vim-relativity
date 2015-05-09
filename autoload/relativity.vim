" Load once only for compatible versions
if (exists('g:loaded_relativity') && g:loaded_relativity) || &cp || v:version < 703
  finish
endif
let g:loaded_relativity = 1

" This is basic vim plugin boilerplate
let s:save_cpo = &cpo
set cpo&vim

let s:number_save = &number
let s:relativenumber_save = &relativenumber

" boilerplate to restore cpo
function! s:restore_cpo()
  let &cpo = s:save_cpo
  unlet s:save_cpo
endfunction

" Blacklist certain plugins and buffer types
function! s:is_blacklisted()
  for ft in g:relativity_filetype_ignore
    if &ft =~ ft
      return 1
    endif
  endfor

  for buftype in g:relativity_buftype_ignore
    if &buftype =~ buftype
      return 1
    endif
  endfor
  return 0
endfunction

function! s:enable_relative_number()
  if s:is_blacklisted()
    return
  endif
  if get(g:, 'relativity_current_absolute', 1)
    setlocal number
  else
    setlocal nonumber
  endif
  setlocal relativenumber
endfunction

function! s:disable_relative_number()
  if s:is_blacklisted()
    return
  endif
  setlocal number norelativenumber
endfunction

" Enable toggling of relative line numbers
function s:relativity_on()
  call s:enable_relative_number()
  augroup relativity
    autocmd!
    if g:relativity_focus_toggle
      autocmd BufEnter *    call s:enable_relative_number()
      autocmd BufLeave *    call s:disable_relative_number()
      autocmd WinEnter *    call s:enable_relative_number()
      autocmd WinLeave *    call s:disable_relative_number()
      autocmd FocusLost *   call s:disable_relative_number()
      autocmd FocusGained * call s:enable_relative_number()
    endif
    if g:relativity_insert_toggle
      autocmd InsertEnter * call s:disable_relative_number()
      autocmd InsertLeave * call s:enable_relative_number()
    endif
  augroup END
endfunction

" Disable toggling of relative line numbers
function s:relativity_off()
  if !exists('#relativity')
    return
  endif

  " Clear autocommands
  augroup relativity
    autocmd!
  augroup END
  augroup! relativity

  " Restore user settings
  if (exists('s:number_save'))
    let &number = s:number_save
  endif
  if (exists('s:relativenumber_save'))
    let &relativenumber = s:relativenumber_save
  endif
endfunction

function! relativity#execute(bang)
  if a:bang
    if exists('#relativity')
      call s:relativity_off()
    endif
  else
    if exists('#relativity') == 0
      call s:relativity_on()
    else
      call s:relativity_off()
    end
  end
endfunction

" This is basic vim plugin boilerplate
call s:restore_cpo()
