if !has_key(g:plugs, 'coc.nvim') || exists('g:gui_oni')
  finish
endif

let languageservers = {}

if executable('lua-lsp')
  let languageservers['lua'] = {
        \ 'command': 'lua-lsp'
        \ 'filetypes': ['lua']
        \}
endif

let s:reason_language_server = $HOME.'/reason-language-server/reason-language-server.exe'
if filereadable(s:reason_language_server)
let languageservers['reason'] = {
      \ 'command': s:reason_language_server,
      \ 'trace.server': 'verbose',
      \ 'filetypes': ['reason'],
      \}
endif

if executable('ocaml-language-server')
  let languageservers['ocaml'] = {
        \ 'command': 'ocaml-language-server',
        \ 'args': ['--stdio'],
        \ 'trace.server': 'verbose',
        \ 'filetypes': ['ocaml'],
        \}
endif

if executable('flow-language-server')
  let languageservers['flow'] = {
        \ "command": "flow-language-server",
        \ "args": ["--stdio"],
        \ "filetypes": ["javascript", "javascriptreact"],
        \ "rootPatterns": [".flowconfig"]
        \}
endif

if executable('go-languageserver')
  let languageservers['golang'] = {
        \ "command": "go-langserver",
        \ "filetypes": ["go"],
        \ "revealOutputChannelOn": "never",
        \ "initializationOptions": {
        \ "gocodeCompletionEnabled": true,
        \ "diagnosticsEnabled": true,
        \ "lintTool": "golint"
        \ }
        \}
endif

if !empty(languageservers)
  call coc#config('languageserver', languageservers)
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
iunmap <TAB>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <localleader>gi <Plug>(coc-implementation)
nmap <silent> <localleader>gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
    " let l:three_point_six_seconds = 3600
    " call timer_start(l:three_point_six_seconds, { tid -> execute('pclose!') })
  endif
endfunction

augroup CoCAutocommands
  au!
  autocmd CursorHoldI * call CocAction('showSignatureHelp')
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,javascript,javascript.jsx setlocal formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
