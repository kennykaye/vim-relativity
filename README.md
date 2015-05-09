vim-relativity
=========================================================

> Toggle relative line numbers with ease.

Installation
------------

Use your favorite plugin manager.

- [vim-plug](https://github.com/junegunn/vim-plug)
  1. Add `Plug 'kennykaye/vim-relativity'` to .vimrc
  2. Run `:PlugInstall`

Usage
-----

- `:Relativity`
    - Toggle Relativity
- `:Relativity!`
    - Turn Relativity off

Configuration
-------------

- `g:relativity_buffer_toggle` (default: 1)
- `g:relativity_window_toggle` (default: 1)
- `g:relativity_insert_toggle` (default: 1)
- `g:relativity_focus_toggle` (default: 1)
- `g:relativity_current_absolute` (default: 1)
- `g:relativity_enabled_on_start` (default: 1)
- `g:relativity_buftype_ignore` (default: `['nofile']`)
- `g:relativity_filetype_ignore` (default: `['ControlP', 'nerdtree', 'fugitive', 'tagbar', 'agsv']`)

Inspiration
-----------

- [vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)

License
-------

MIT
