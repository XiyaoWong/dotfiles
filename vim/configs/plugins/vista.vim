if !has_key(g:plugs, "vista.vim")
  finish
endif

let g:vista_echo_cursor_strategy = "both"
let g:vista_disable_statusline = 1
let g:vista_vimwiki_executive = 'markdown'

if has_key(g:plugs, "coc.nvim")
  let g:vista_default_executive = "coc"
endif

nnoremap <silent> <leader>v :Vista!!<CR>
