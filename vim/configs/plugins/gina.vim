" Plugin Mappings
call gina#custom#mapping#nmap('/.*', '<Tab>', '<Plug>(gina-builtin-choice)')
call gina#custom#mapping#vmap('/.*', '<Tab>', '<Plug>(gina-builtin-choice)')
call gina#custom#execute('/.*', 'silent! nunmap <buffer> a')
call gina#custom#execute('/.*', 'silent! vunmap <buffer> a')
call gina#custom#execute('/.*', 'silent! nunmap <buffer> <c-j>')
call gina#custom#execute('/.*', 'silent! vunmap <buffer> <c-k>')
call gina#custom#execute('/.*', 'silent! nnoremap <buffer> q :q<cr>')
call gina#custom#execute('/.*', 'silent! nnoremap <buffer> Q :q!<cr>')

" Aliases
call gina#custom#command#alias('branch', 'br')
call gina#custom#command#option('br', '-v', 'v')
call gina#custom#command#alias('status', 'st')

" Options
call gina#custom#command#option(
      \ 'commit', '-v|--verbose'
      \)

call gina#custom#execute(
      \ '/\%(status\|branch\|ls\|grep\|changes\|tag\)',
      \ 'setlocal winfixheight',
      \)

call gina#custom#command#option(
      \ '/\%(log\|reflog\)',
      \ '--opener', 'vsplit'
      \)

" Open these window types as small re-usable splits
call gina#custom#command#option(
      \ '/\%(status\|commit\|branch\)',
      \ '--opener', &previewheight . 'split',
      \ '--group', 'short'
      \)

" Execute :Gina commit with cc on "gina-status" buffer
call gina#custom#mapping#nmap(
      \ 'status', 'cc',
      \ ':<C-u>Gina commit<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)

" Execute :Gina status with cc on "gina-commit" buffer
call gina#custom#mapping#nmap(
      \ 'commit', 'cc',
      \ ':<C-u>Gina status<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)

" General Mappings
nnoremap <silent><nowait> <localleader>gs :Gina status<cr>
nnoremap <silent><nowait> <localleader>gc :Gina commit<cr>
nnoremap <silent><nowait> <localleader>gp :Gina push<cr>
