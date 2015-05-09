vim-relativity
=========================================================

> Toggle relative line numbers with ease.

Installation
------------

Please use your favorite plugin manager.

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

| Option                              | Default | Description                                          |
| ----------------------------------- | ------- | ---------------------------------------------------- |
| `g:relativity_insert_toggle`        | 1       | Enables toggling on `InsertEnter` and `InsertLeave`. |
| `g:relativity_focus_toggle`         | 1       | Enables toggling on `FocusEnter` and `FocusLeave`.   |
| `g:relativity_current_absolute`     | 1       | Displays absolute line number for current line.      |
| `g:relativity_enabled_on_start`     | 1       | Enable Relativity automatically when vim starts.     |
| `g:relativity_buftype_ignore`       | `['nofile']` | A list of buffer types to disable toggling for. |
| `g:relativity_filetype_ignore`      | `['controlp', 'nerdtree', 'fugitive', 'tagbar', 'agsv']` | A list of filetypes to disable toggling for. |

Inspiration
-----------

Inspired by [numbers.vim](https://github.com/myusuf3/numbers.vim) and [vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)

License
-------

MIT
