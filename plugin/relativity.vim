command! -nargs=? -bar -bang Relativity call relativity#execute(<bang>0)

if !get(g:, 'relativity_enabled_on_start', 1)
  call relativity#execute()
endif
