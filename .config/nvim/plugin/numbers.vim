" Inspiration
" 1. vim-relativity
" 2. numbers.vim - https://github.com/myusuf3/numbers.vim/blob/master/plugin/numbers.vim
"
" NOTE: it's important that we use BufReadPost as otherwise the buftype and filetype
" variables might not be set correctly
let g:number_filetype_exclusions = [
      \ 'markdown',
      \ 'vimwiki',
      \ 'vim-plug',
      \ 'gitcommit',
      \ 'toggleterm',
      \ 'fugitive',
      \ 'coc-explorer',
      \ 'coc-list',
      \ 'list',
      \ 'NvimTree',
      \ 'startify',
      \ 'help',
      \ 'todoist'
      \ ]

let g:number_buftype_exclusions = [
      \ 'terminal',
      \ 'nowrite',
      \ 'quickfix',
      \ 'help',
      \ 'nofile',
      \ 'acwrite'
      \ ]

augroup ToggleRelativeLineNumbers
  autocmd!
  autocmd BufEnter    * call numbers#enable_relative_number()
  autocmd BufLeave    * call numbers#disable_relative_number()
  autocmd FileType    * call numbers#enable_relative_number()
  autocmd FocusGained * call numbers#enable_relative_number()
  autocmd FocusLost   * call numbers#disable_relative_number()
  autocmd InsertEnter * call numbers#disable_relative_number()
  autocmd InsertLeave * call numbers#enable_relative_number()
augroup end
