command! -nargs=? -bar -bang Relativity call relativity#execute(<bang>0)

let g:relativity_insert_toggle =
  \ get( g:, 'relativity_insert_toggle', 1 )

let g:relativity_focus_toggle =
  \ get( g:, 'relativity_focus_toggle', 1 )

let g:relativity_current_absolute =
  \ get( g:, 'relativity_current_absolute', 1 )

let g:relativity_enabled_on_start =
  \ get( g:, 'relativity_enabled_on_start', 1 )

let g:relativity_buftype_ignore =
  \ get( g:, 'relativity_buftype_ignore', ['nofile'] )

let g:relativity_filetype_ignore =
  \ get( g:, 'relativity_filetype_ignore', ['controlp', 'nerdtree', 'fugitive', 'tagbar', 'agsv'] )

" On-demand loading. Let's use the autoload folder and not slow down vim's
" startup procedure.
augroup relativityStart
  autocmd!
  if g:relativity_enabled_on_start
    autocmd VimEnter * call relativity#execute(0)
  endif
augroup END
