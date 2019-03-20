if !has_key(g:plugs, 'coc.nvim') || exists('g:gui_oni')
  finish
endif
if has('nvim-0.4.0')
  let g:coc_force_debug = 1
  " hi link CocErrorFloat Pmenu
  " hi link CocWarningFloat Pmenu
endif

let g:coc_global_extensions = [ 
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-rls',
      \ 'coc-snippets',
      \ 'coc-emmet',
      \ 'coc-highlight',
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-jest',
      \ ]

" Run jest for current project
command! -nargs=0 Jest :call  CocActionAsync('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocActionAsync('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocActionAsync('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocActionAsync('runCommand', 'jest.init')

" FIXME: use new g:coc_user_config setting add these vars
function! s:coc_init() abort
  let s:languageservers = {}

  if executable('lua-lsp')
    let s:languageservers['lua'] = {
          \ 'command': 'lua-lsp'
          \ 'filetypes': ['lua']
          \}
  endif


  if executable('ccls')
    let s:languageservers['ccls'] = {
          \ "command": "ccls",
          \ "filetypes": ["c", "cpp", "objc", "objcpp"],
          \ "rootPatterns": [".ccls", "compile_commands.json", ".vim/", ".git/", ".hg/"],
          \ "initializationOptions": {
          \ "cacheDirectory": "/tmp/ccls"
          \}
          \}
  endif

  if executable('ocaml-language-server')
    let s:languageservers['ocaml'] = {
          \ 'command': 'ocaml-language-server',
          \ 'args': ['--stdio'],
          \ 'trace.server': 'verbose',
          \ 'filetypes': ['ocaml', 'reason'],
          \}
  endif

  if executable('flow-language-server')
    let s:languageservers['flow'] = {
          \ "command": "flow",
          \ "args": ["lsp"],
          \ "filetypes": ["javascript", "javascriptreact", "javascript.jsx"],
          \ "rootPatterns": [".flowconfig"]
          \}
  endif

  if executable('bingo')
    let s:languageservers['golang'] = {
          \ "command": "bingo",
          \ "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
          \ "filetypes": ["go"]
          \}
  endif

  " if executable('go-langserver')
  "   let s:languageservers['golang'] = {
  "         \ "command": "go-langserver",
  "         \ "filetypes": ["go"],
  "         \ "revealOutputChannelOn": "never",
  "         \ "initializationOptions": {
  "         \   "gocodeCompletionEnabled": v:true,
  "         \   "diagnosticsEnabled": v:true,
  "         \   "lintTool": "golint"
  "         \ }
  "         \}
  " endif

  " let s:reason_language_server = $HOME.'/reason-language-server/reason-language-server.exe'
  " if filereadable(s:reason_language_server)
  "   let s:languageservers['reason'] = {
  "         \ 'command': s:reason_language_server,
  "         \ 'trace.server': 'verbose',
  "         \ 'filetypes': ['reason'],
  "         \ 'settings': {
  "         \  'reason_language_server': {
  "         \    'build_system_override_by_root': 'dune:esy',
  "         \    'per_value_codelens': v:true,
  "         \   }
  "         \ }
  "         \}
  " endif

  if !empty(s:languageservers)
    call coc#config('languageserver', s:languageservers)
  endif
endfunction

augroup InitCoc
  autocmd!
  autocmd VimEnter * call s:coc_init()
augroup End

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
nmap <silent> <localleader>y <Plug>(coc-type-definition)
nmap <silent> <localleader>i <Plug>(coc-implementation)
nmap <silent> <localleader>r <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction


function! s:coc_highlights() abort
  highlight link CocErrorHighlight SpellBad
  " highlight link CocErrorLine CocErrorHighlight
  " highlight link CocWarningLine ALEWarningSign
  highlight CocCodeLens ctermfg=Gray guifg=#999999
endfunction

augroup CoCAutocommands
  au!
  autocmd ColorScheme * call s:coc_highlights() 
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,javascript,javascript.jsx setlocal formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd CursorHoldI * call CocActionAsync('showSignatureHelp')
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
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

" Using CocList
" Show all diagnostics
nnoremap <silent> <localleader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <localleader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <localleader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <localleader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <localleader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <localleader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <localleader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <localleader>p  :<C-u>CocListResume<CR>

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocActionAsync('format')
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocActionAsync('fold', <f-args>)
