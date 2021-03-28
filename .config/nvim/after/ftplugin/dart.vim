" Open flutter only commands in dart files
let tools_path = has('mac') ? 'flutter-tools.nvim' : 'local-flutter-tools'

if v:lua.plugin_loaded('coc.nvim')
  nnoremap <silent> <leader>dc  :CocList --input=flutter commands<CR>
  nnoremap <silent> <leader>de  :CocCommand flutter.emulators<CR>
  nnoremap <silent> <leader>dl  :CocCommand flutter.dev.openDevLog<CR>
  nnoremap <silent> <leader>dq  :CocCommand flutter.dev.quit<CR>
  nnoremap <silent> <leader>do  :CocCommand flutter.toggleOutline<CR>
  nnoremap <silent> <leader>drn :CocCommand flutter.run<CR>
  nnoremap <silent> <leader>drs :CocCommand flutter.dev.hotRestart<CR>
  nnoremap <silent> <leader>dd  :CocCommand flutter.devices<CR>
elseif v:lua.plugin_loaded(tools_path)
  nnoremap <silent> <leader>de  :FlutterEmulators<CR>
  nnoremap <silent> <leader>dq  :FlutterQuit<CR>
  nnoremap <silent> <leader>drn :FlutterRun<CR>
  nnoremap <silent> <leader>drs :FlutterRestart<CR>
  nnoremap <silent> <leader>dd  :FlutterDevices<CR>
  nnoremap <silent> <leader>do  :FlutterOutline<CR>
  " nnoremap <silent> <leader>dl  :CocCommand flutter.dev.openDevLog<CR>
endif

if exists('g:which_leader_key_map')
  let g:which_leader_key_map.d = {
        \ 'name': '+dart',
        \ 'c': 'flutter: commands',
        \ 'd': 'flutter: devices',
        \ 'e': 'flutter: emulators',
        \ 'l': 'flutter: dev log',
        \ 'o': 'flutter: outline',
        \ 'q': 'flutter: quit',
        \ 'r': {
        \   'name': '+dev-server',
        \   'n': 'run',
        \   's': 'restart'
        \  },
        \ }
endif

lua << EOF
-- Remove treesitter highlighting for brackets in dart files
-- so rainbow parens can work instead
vim.cmd [[highlight link TSPunctBracket Normal]]
require("nvim-treesitter.highlight")
vim.treesitter.highlighter.hl_map["punctuation.bracket"] = nil
EOF
