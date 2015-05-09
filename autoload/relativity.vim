" Load once only for compatible versions
if (exists('g:loaded_relativity') && g:loaded_relativity) || &cp || v:version < 703
  finish
endif
let g:loaded_relativity = 1
let s:number_save = &number
let s:relativenumber_save = &relativenumber

" Blacklist certain plugins and buffer types
function! NumberBlackList()
  let s:bufferBlackList = 'nofile'
  let s:relativeNumberBlackList = 'ControlP\|NERD\|fugitive\|Tagbar\|agsv'
  if &ft =~ s:relativeNumberBlackList || &buftype =~ s:bufferBlackList
    return 1
  else
    return 0
  endif
endfunction

function! s:enable_relative_number()
  if NumberBlackList()
    return
  endif
  if !get(g:, 'relativity_current_absolute', 1)
    setlocal number
  else
    setlocal nonumber
  endif
  setlocal relativenumber
endfunction

function! s:disable_relative_number()
  if NumberBlackList()
    return
  endif
  setlocal number norelativenumber
endfunction

" Enable toggling of relative line numbers
function s:relativity_on()
  augroup relativity
    autocmd!
    autocmd BufEnter *    call s:enable_relative_number()
    autocmd BufLeave *    call s:disable_relative_number()
    autocmd WinEnter *    call s:enable_relative_number()
    autocmd WinLeave *    call s:disable_relative_number()
    autocmd InsertEnter * call s:disable_relative_number()
    autocmd InsertLeave * call s:enable_relative_number()
    autocmd FocusLost *   call s:disable_relative_number()
    autocmd FocusGained * call s:enable_relative_number()
  augroup END
endfunction

" Disable toggling of relative line numbers
function s:relativity_off()
  augroup relativity
    autocmd!
  augroup END
  let &number = s:number_save
  let &relativenumber = s:relativenumber_save
  unlet s:number_save
  unlet s:relativenumber_save
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
