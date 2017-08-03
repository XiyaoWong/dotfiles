" ________  ___  __    ___  ________   ________           ________  ________  ________   ________ ___  ________
"|\   __  \|\  \|\  \ |\  \|\   ___  \|\   ____\         |\   ____\|\   __  \|\   ___  \|\  _____\\  \|\   ____\
"\ \  \|\  \ \  \/  /|\ \  \ \  \\ \  \ \  \___|_        \ \  \___|\ \  \|\  \ \  \\ \  \ \  \__/\ \  \ \  \___|
" \ \   __  \ \   ___  \ \  \ \  \\ \  \ \_____  \        \ \  \    \ \  \\\  \ \  \\ \  \ \   __\\ \  \ \  \  ___
"  \ \  \ \  \ \  \\ \  \ \  \ \  \\ \  \|____|\  \        \ \  \____\ \  \\\  \ \  \\ \  \ \  \_| \ \  \ \  \|\  \
"   \ \__\ \__\ \__\\ \__\ \__\ \__\\ \__\____\_\  \        \ \_______\ \_______\ \__\\ \__\ \__\   \ \__\ \_______\
"    \|__|\|__|\|__| \|__|\|__|\|__| \|__|\_________\        \|_______|\|_______|\|__| \|__|\|__|    \|__|\|_______|
"                                        \|_________|


"Sections of this vimrc can be folded or unfolded using za, they are marked with 3 curly braces


set nocompatible "IMproved, required
filetype off " required  Prevents potential side-effects
" from system ftdetects scripts
"-----------------------------------------------------------
"PLUGINS {{{
"-----------------------------------------------------------
"This will autoinstall vim plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"set the runtime path to include Vundle and initialise
call plug#begin('~/.vim/plugged')

if !has('nvim')
  if has('unix')
    if empty($SSH_CONNECTION)
      Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --tern-completer' }
    endif
  endif
endif
"NVIM ====================================
Plug 'Shougo/deoplete.nvim', Cond(has('nvim'), { 'do': ':UpdateRemotePlugins' })
Plug 'mhartington/nvim-typescript', Cond(has('nvim'))
Plug 'carlitux/deoplete-ternjs', Cond(has('nvim'), { 'do': 'npm install -g tern' })
Plug 'Shougo/vimproc.vim', Cond(has('vim'))
Plug 'ervandew/supertab', Cond(has('nvim'))
Plug 'w0rp/ale' " Ale  Async Linting as you type
Plug 'SirVer/ultisnips' "Added vim snippets for code autofilling
Plug 'Shougo/echodoc.vim'
"================================
Plug 'scrooloose/nerdtree' "Added nerdtree filetree omnitool : )
Plug 'mattn/emmet-vim' "Added emmet vim plugin
Plug 'Raimondi/delimitMate' "Add delimitmate
Plug 'easymotion/vim-easymotion' "Added easy motions
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'ternjs/tern_for_vim',{'do':function('BuildTern')}  "Add Tern for autocompletion
Plug 'mhinz/vim-startify' " A fun start up sceen for vim + session management to boot
if !has('gui_running')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  | Plug 'junegunn/fzf.vim'
endif
Plug 'ctrlpvim/ctrlp.vim', Cond(has('gui_running'))
Plug 'tpope/vim-capslock' "Capslock without a capslock key in vim
Plug 'junegunn/vim-easy-align', { 'on': [ '<Plug>(EasyAlign)' ] } "Added June Gunn's alignment plugin

"TMUX ============================
if executable("tmux")
  Plug 'christoomey/vim-tmux-navigator' "Navigate panes in vim and tmux with the same bindings
endif

"Utilities ============================
Plug 'sjl/gundo.vim',{'on':'GundoToggle'} "Add Gundo - undo plugin for vim
Plug 'chip/vim-fat-finger', { 'on':[] } "Autocorrects 4,000 common typos
augroup load_fat_finger
  autocmd!
  autocmd InsertEnter * call plug#load('vim-fat-finger')
        \| autocmd! load_fat_finger
augroup END
Plug 'itchyny/vim-cursorword' "Underlines instances of word under the cursor
Plug 'junegunn/goyo.vim', { 'for': 'markdown' } "Peace and Quiet thanks JGunn
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
"TPOPE ====================================
"Very handy plugins and functionality by Tpope (ofc)
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' " Add fugitive git status and command plugins
Plug 'tpope/vim-eunuch' " Adds file manipulation functionality
Plug 'tpope/vim-repeat' " . to repeat more actions
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fireplace'

"Syntax ============================
"Plug 'HerringtonDarkholme/yats.vim', { 'for':'typescript' }
Plug 'sheerun/vim-polyglot'
Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescript'  }
if !has('nvim')
  if !has('gui_running')
    Plug 'Quramy/tsuquyomi'
  endif
endif
Plug 'othree/javascript-libraries-syntax.vim', { 'for':['javascript', 'typescript'] } "Added vim polyglot a collection of language packs for vim
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'editorconfig/editorconfig-vim' "Added Editor Config plugin to maintain style choices
Plug 'vim-scripts/dbext.vim' "Need this to run SQL Lint
Plug 'lilydjwg/colorizer', { 'for':['css', 'js', 'ts'] }

"Git ===============================
Plug 'airblade/vim-gitgutter' "Add a GitGutter to track new lines re git file
Plug 'rhysd/committia.vim' "create diff window and Gstatus window on commit

"Text Objects =====================
Plug 'kana/vim-textobj-user' "Text object library plugin for defining your own text objects
Plug 'glts/vim-textobj-comment' "Text obj for comments
Plug 'bkad/CamelCaseMotion' "uses a prefix of the leader key to implement text objects e.g. ci<leader>w will change all of one camelcased word
Plug 'michaeljsmith/vim-indent-object' " Add text object for indented code = 'i' i.e dii delete inner indented block
Plug 'terryma/vim-expand-region' " All encompasing v
Plug 'wellle/targets.vim' "Moar textobjs

"Search Tools =======================
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] } "Excellent for multiple search and replace functionality

"Coding tools =======================
Plug 'janko-m/vim-test'
Plug 'yuttie/comfortable-motion.vim'
Plug 'scrooloose/nerdcommenter'
if !has('gui_running')
  Plug 'ryanoasis/vim-devicons' " This Plugin must load after the others - Add file type icons to vim
  Plug 'othree/jspc.vim'
endif

"Filetype Plugins ======================
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'fatih/vim-go',{ 'for': 'go', 'do': ':GoInstallBinaries' } "Go for Vim

"Themes ===============================
Plug 'rhysd/try-colorscheme.vim', {'on':'TryColorscheme'}
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'rakr/vim-one'
call plug#end()

" filetype plugin indent on - ESSENTIAL but initialised by vim-plug
 syntax enable
"Added built in match it plugin to vim the longer command a la tpope only loads
"this the user has not already installed a new version of matchit
" packadd! matchit
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

"}}}
"====================================================================================
"Leader bindings
"====================================================================================
let mapleader = "," "Remap leader key
let maplocalleader = "\<space>" "Local leader key
"--------------------------------------------------------------------------------------------------
"COMMANDS {{{
"--------------------------------------------------------------------------------------------------
"==============================================================
"MAPPINGS {{{
"==============================================================
source ~/Dotfiles/vim/mappings.vim
"--------------------------------------------------------------------------------------------------
"PLUGIN MAPPINGS {{{
"--------------------------------------------------------------------------------------------------
command! PU PlugUpdate | PlugUpgrade
"=============================================================
"               Airline
"=============================================================
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_powerline_fonts                  = 1
let g:airline#extensions#tabline#enabled       = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#show_tabs     = 1
let g:airline#extensions#tabline#tab_nr_type   = 2 " Show # of splits and tab #
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_type = 1

" configure whether close button should be shown: >
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#ale#enabled = 1
" determine whether inactive windows should have the left section collapsed to
" only the filename of that buffer.  >
let g:airline_inactive_collapse = 1
 let g:airline#extensions#tabline#close_symbol = 'x' " * configure symbol used to represent close button >
" * configure pattern to be ignored on BufAdd autocommand >
" fixes unnecessary redraw, when e.g. opening Gundo window
let airline#extensions#tabline#ignore_bufadd_pat =
      \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <localleader>1 <Plug>AirlineSelectTab1
nmap <localleader>2 <Plug>AirlineSelectTab2
nmap <localleader>3 <Plug>AirlineSelectTab3
nmap <localleader>4 <Plug>AirlineSelectTab4
nmap <localleader>5 <Plug>AirlineSelectTab5
nmap <localleader>6 <Plug>AirlineSelectTab6
nmap <localleader>7 <Plug>AirlineSelectTab7
nmap <localleader>8 <Plug>AirlineSelectTab8
nmap <localleader>9 <Plug>AirlineSelectTab9
nmap <localleader>- <Plug>AirlineSelectPrevTab
nmap <localleader>+ <Plug>AirlineSelectNextTab
"--------------------------------------------
" CTRLSF - CTRL-SHIFT-F
"--------------------------------------------
let g:ctrlsf_default_root = 'project+fw' "Search at the project root i.e git or hg folder
let g:ctrlsf_win_size = "30%"
let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules']
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

"--------------------------------------------
" FZF bindings
"--------------------------------------------
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
if !has('gui_running')
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow  --color "always" '.shellescape(<q-args>), 1, <bang>0)
let g:fzf_files_options =
      \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'
" Use ripgrep instead of ag:
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
" Advanced customization using autoload functions
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')
nnoremap <silent> <localleader>o :Buffers<CR>
nnoremap <silent> <localleader>a :Windows<CR>
nnoremap <silent> <localleader>a :Windows<CR>
nnoremap <silent> <localleader>H :History<CR>
nnoremap <silent> <localleader>C :Commits<CR>

function! SearchWordWithRg()
  execute 'Rg' expand('<cword>')
endfunction
" Launch file search using FZF - FZFR Uses the project's root regardless of where vim is
nnoremap <localleader>p :GitFiles <CR>
nnoremap <C-P> :call Fzf_dev()<CR>
" nnoremap <space>\ :Find<space>
nnoremap \ :Rg<CR>
nnoremap <space>\ :call SearchWordWithRg()<CR>
endif

"This allows me to use control-f to jump out of a newly matched pair (courtesty
"of delimitmate)
imap <C-F> <C-g>g

nnoremap gm :Xmark<<CR>

let g:textobj_comment_no_default_key_mappings = 1
xmap ac <Plug>(textobj-comment-a)
omap ac <Plug>(textobj-comment-a)
xmap ic <Plug>(textobj-comment-i)
omap ic <Plug>(textobj-comment-i)
"--------------------------------------------

"-----------------------------------------------------------
"     ALE
"-----------------------------------------------------------
" Disable linting for all minified JS files.
let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}
let g:ale_fixers = {}
let g:ale_fixers.javascript = [
  \ 'prettier', 'eslint'
  \]
let g:ale_fixers.python = [
  \ 'flake8',
  \]
let g:ale_fixers.typescript = [
  \ 'prettier',
  \]
let g:ale_fixers.css = [
  \ 'stylelint',
  \]
let g:ale_fixers.html = [
  \ 'tidy',
  \]

"let g:ale_typescript_tsserver_use_global = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5' "Order of arguments matters here!!
let g:ale_echo_msg_format = '%linter%: %s [%severity%]'
let g:ale_sign_column_always = 1
let g:ale_sign_error         = '✘'
let g:ale_sign_warning       = '⚠️'
"\'typescript.jsx':['tslint', 'tsserver', 'typecheck'],
let g:ale_linters            = {
      \'python': ['flake8'],
      \'css': ['stylelint'],
      \'jsx': ['eslint'],
      \'sql': ['sqlint'],
      \'typescript':['tslint', 'tsserver', 'typecheck'],
      \'html':[]
      \}
let g:ale_linter_aliases     = {'jsx': 'css'}
let g:ale_set_highlights = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ OK']
nmap <silent> <C-/> <Plug>(ale_previous_wrap)
nmap <silent> <C-\> <Plug>(ale_next_wrap)

imap <C-L> <C-O><Plug>CapsLockToggle
"--------------------------------------------
"Fugitive bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gb :Gbrowse<CR> "Open current file on github.com
vnoremap <leader>gb :Gbrowse<CR> "Make it work in Visual mode to open with highlighted linenumbers
" Push the repository of the currently opened file
"--------------------------------------------
" JSX & POLYGLOT
"--------------------------------------------
let g:jsx_ext_required = 0 "JSX files are not treated as js - so vim-jsx does not auto apply, fixes folding issues
"VIM-GO
let g:go_doc_keywordprg_enabled = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

"--------------------------------------------
" Git Gutter
"--------------------------------------------
nnoremap <leader>gg :GitGutterToggle<CR>
let g:gitgutter_enabled = 0
let g:gitgutter_sign_modified = '•'
let g:gitgutter_eager = 1
let g:gitgutter_sign_added    = '❖'
set signcolumn="yes"
let g:gitgutter_grep_command = 'ag --nocolor'

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nnoremap <C-F> :SidewaysLeft<cr>
nnoremap <C-F>r :SidewaysRight<cr>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vnoremap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

let g:javascript_plugin_flow       = 1
let g:javascript_conceal_undefined = "¿"
let g:javascript_conceal_super     = "Ω"
let g:javascript_conceal_null      = "ø"
let g:javascript_plugin_jsdoc      = 1

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  " Additional settings
  setlocal spell
  " If no commit message, start with insert mode
  if a:info.vcs ==# 'git' && getline(1) ==# ''
    startinsert
  end
  " Scroll the diff window from insert mode
  " Map <C-n> and <C-p>
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

"NERDTree
" =============================================
" Ctrl+N to toggle Nerd Tree
 function! NERDTreeToggleAndFind()
    if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
      execute ':NERDTreeClose'
    else
      execute ':NERDTreeFind'
    endif
  endfunction
nnoremap <C-N> :NERDTreeToggle<CR>
nnoremap <localleader>n :call NERDTreeToggleAndFind()<CR>

let g:NERDTreeHijackNetrw             = 0 "Off as it messes with startify's autoload session
let g:NERDTreeAutoDeleteBuffer        = 1
let g:NERDTreeWinSize                 = 30
let g:NERDTreeDirArrowExpandable      = '├'
let g:NERDTreeDirArrowCollapsible     = '└'
let NERDTreeQuitOnOpen                = 1
let NERDTreeMinimalUI                 = 1
let NERDTreeDirArrows                 = 1
let NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeShowBookmarks           = 1
let NERDTreeAutoDeleteBuffer          = 1
let NERDTreeShowHidden                = 1 "Show hidden files by default

"===================================================
"EasyMotion mappings
"===================================================
let g:EasyMotion_do_mapping = 0 "Disable default mappings
" Use uppercase target labels and type as a lower case
" let g:EasyMotion_use_upper  1
" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
" keep cursor column when jumping
let g:EasyMotion_startofline = 0
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" nmap s <Plug>(easymotion-s)
" Jump to anwhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
map s <Plug>(easymotion-f)
nmap s <Plug>(easymotion-overwin-f)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"Search with easy motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"=======================================================================
"                    EMMET for Vim
"=======================================================================
"Emmet for vim leader keymap
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
    " try to determine if we're within quotes or tags.
  " if so, assume we're in an emmet fill area.
  let line = getline('.')
  if col('.') < len(line)
    let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')

    if len(line) >= 2
      return "\<Plug>(emmet-move-next)"
    endif
  endif

  " go to next item in a popup menu.
  if pumvisible()
    return "\<C-n>"
  endif

  " expand anything emmet thinks is expandable.
  " I'm not sure control ever reaches below this block.
  if emmet#isExpandable()
    return "\<Plug>(emmet-expand-abbr)"
  endif

  " return a regular tab character
  return "\<tab>"
  endfunction
let g:user_emmet_mode         = 'a'
let g:user_emmet_complete_tag = 1
let g:user_emmet_settings     = {
          \'javascript': {'extends': 'jsx'},
          \'typescript':{'extends': 'tsx'}
          \}
let g:user_emmet_leader_key     = "<C-Y>"
let g:user_emmet_expandabbr_key =  "<C-Y>"
let g:user_emmet_install_global = 0

nnoremap <leader>u :GundoToggle<CR>

"Set up libraries to highlight with library syntax highlighter
let g:used_javascript_libs = 'underscore,jquery,hapi,mocha,redux,react-apollo,express,react,jasmine,chai,handlebars,requirejs'
"}}}
"====================================================================================
"AUTOCOMMANDS {{{
"===================================================================================

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
   let l = 1
   let n_lines = 0
   let w_width = winwidth(0)
   while l <= line('$')
       " number to float for division
       let l_len = strlen(getline(l)) + 0.0
       let line_width = l_len/w_width
       let n_lines += float2nr(ceil(line_width))
       let l += 1
   endw
   exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Close help and git window by pressing q.
augroup quickfix_menu_quit
  autocmd!
  autocmd FileType help,git-status,git-log,qf,
        \gitcommit,quickrun,qfreplace,ref,
        \simpletap-summary,vcs-commit,vcs-status,vim-hacks
        \ nnoremap <buffer><silent> q :<C-u>call <sid>smart_close()<CR>
  autocmd FileType * if (&readonly || !&modifiable) && !hasmapto('q', 'n')
        \ | nnoremap <buffer><silent> q :<C-u>call <sid>smart_close()<CR>| endif
augroup END

function! s:smart_close()
  if winnr('$') != 1
    close
  endif
endfunction

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup Go_Mappings
  autocmd!
  autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4 nolist
  autocmd BufNewFile,WinEnter,BufRead *.go setlocal nolist
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
augroup END

augroup CheckOutsideTime - "excellent function but implemented by terminus
  autocmd!
  autocmd WinEnter,BufRead,BufEnter,FocusGained * silent! checktime " automatically check for changed files outside vim
  au FocusLost * silent! wa "Saves all files on switching tabs i.e losing focus, ignoring warnings about untitled buffers
augroup end

" Disable paste.
augroup Cancel_Paste
  autocmd!
  autocmd InsertLeave *
        \ if &paste | set nopaste | echo 'nopaste' | endif
augroup END

augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
  if has('gui_running')
    source $MYGVIMRC | echo 'Source .gvimrc'
  endif
augroup END


augroup VimResizing
  autocmd!
  autocmd VimResized * wincmd =
  autocmd FocusLost * :wa
  autocmd VimResized * :redraw! | :echo 'Redrew'
augroup END

augroup filetype_completion
  autocmd!
  autocmd FileType html,css,javascript,typescript,typscript.tsx,javascript.jsx EmmetInstall
  autocmd FileType html,markdown,css imap <buffer><expr><tab> <sid>expand_html_tab()
  autocmd FileType css,scss,sass,stylus,less setl omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript,javascript.jsx,jsx,tsx,typescript.tsx setlocal omnifunc=tern#Complete
  "autocmd FileType typescript,typescript.jsx setlocal omnifunc=tsuquyomi#Complete
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
augroup END

augroup filetype_javascript_typescript
  autocmd!
  "==================================
  "TypeScript
  "==================================
  autocmd VimEnter,BufNewFile,BufEnter *.ts,*.tsx let b:ale_javascript_prettier_options='--trailing-comma all --tab-width 4 --print-width 100'
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx ALEFix
  "autocmd 
  autocmd FileType typescript setl softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
  "The next line forces four spaces to appear as two which helps maintain my sanity at work
  "autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx
  "==================================
  autocmd FileType typescript,javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd FileType javascript nnoremap <buffer> <leader>co I{/*<C-O>A */}<esc>
  autocmd FileType javascript :iabbrev <buffer> und undefined
  autocmd Filetype javascript setlocal nocindent "don't use cindent for javascript
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile .eslintrc,.stylelintrc,.babelrc set filetype=json
  autocmd FileType javascript setlocal concealcursor=nvic
  autocmd FileType typescript setlocal completeopt+=menu
augroup END

augroup FileType_Clojure
  autocmd!
  " Evaluate Clojure buffers on load
  autocmd BufRead *.clj, *cljs try | silent! Require | catch /^Fireplace/ | endtry
augroup END

augroup FileType_html
  autocmd!
  autocmd BufNewFile, BufRead *.html setlocal nowrap :normal gg=G
augroup END


augroup FileType_markdown
  autocmd!
  autocmd BufNewFile,VimEnter *.md :Xmark<<CR>
  autocmd BufNewFile, BufRead *.md setlocal spell spelllang=en_uk "Detect .md files as mark down
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.md :onoremap <buffer>ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd BufNewFile,BufRead *.md :onoremap <buffer>ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
  autocmd BufNewFile,BufRead *.md :onoremap <buffer>aa :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
  autocmd BufNewFile,BufRead *.md :onoremap <buffer>ia :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd BufNewFile,BufRead *.md :nnoremap <buffer><leader>+ :HeaderIncrease<cr>
  autocmd BufNewFile,BufRead *.md :nnoremap <buffer><leader>- :HeaderDecrease<cr>
augroup END

augroup filetype_vim
  "Vimscript file settings -------------------------
  autocmd!
  "This command makes vim start a file with all folds closed
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
  autocmd CmdwinEnter * nnoremap <silent><buffer> q <C-W>c
augroup END

augroup FileType_text
  autocmd!
  autocmd FileType text setlocal textwidth=78
augroup END

"augroup nvim
  "au!
  "au BufEnter * if &buftype == 'terminal' | :startinsert | endif
"augroup END

augroup FileType_all
  autocmd!
  autocmd FileType python setl ts=4
  autocmd FileType rust setl sw=0 sts=0
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  " Set syntax highlighting for specific file types
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  if exists("*mkdir") "auto-create directories for new files
    autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
  endif
augroup END

augroup fugitiveSettings
  autocmd!
  autocmd FileType gitcommit setlocal nolist
  autocmd BufReadPost fugitive://* setlocal bufhidden=delete
augroup END

"Close vim if only window is a Nerd Tree
augroup NERDTree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

"Stolen from HiCodin's Dotfiles a really cool set of fold text functions
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '(' . ( lines_count ) . ')'
  let foldtextstart = strpart('✦' . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(' ', 2 )
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(' ', winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}
" Javascript {{{
function! FoldText()
  let line = ' ' . substitute(getline(v:foldstart), '{.*', '{...}', ' ') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '(' . ( lines_count ) . ')'
  let foldchar = matchstr(&fillchars, 'fold:\')
  let foldtextstart = strpart('✦' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(' ', 2 )
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(' ', winwidth(0)-foldtextlength) . foldtextend . ' '
endfunction
augroup jsfolding
  autocmd!
  autocmd FileType javascript,javascript.jsx,jsx setlocal foldenable|setlocal foldmethod=indent|setlocal foldtext=FoldText()
  au Filetype javascript,javascript.jsx,jsx setlocal foldlevelstart=99
augroup END
" }}}
" CSS {{{
function! CSSFoldText()
  let line = substitute(getline(v:foldstart), '{.*', '{...}', ' ') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '(' . ( lines_count ) . ')'
  let foldchar = matchstr(&fillchars, 'fold:\')
  let foldtextstart = strpart('✦ ' . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(' ', 2 )
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(' ', winwidth(0)-foldtextlength) . foldtextend . ' '
endfunction
augroup ft_css
  au!
  au Filetype css setlocal foldmethod=indent | setlocal foldlevelstart=99
  au Filetype css setlocal foldmarker={,}
  au FileType css setlocal foldtext=CSSFoldText()
  "au BufWritePost *.css :normal gg=G

augroup END
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are
"}}}
"====================================================================================
"Spelling
"====================================================================================

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git.
set spellfile=$HOME/.vim-spell-en.utf-8.add
set fileformats=unix,dos,mac
" Autocomplete with dictionary words when spell check is on
set complete+=kspell

"===================================================================================
"Mouse {{{
"===================================================================================
set mousehide
set mouse=a "this is the command that works for mousepad
" Swap iTerm2 cursors in [n]vim insert mode when using tmux, more here https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  if !has('nvim')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  "else
    "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif

if !has('nvim')
  set ttymouse=xterm2
  set mouse=a
endif
"}}}
"====================================================================================
"Buffer and Tab settings {{{
"====================================================================================
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set nohidden

" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    exec t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>


"}}}
"---------------------------------------------------------------------------
" NEOVIM
"---------------------------------------------------------------------------
" Terminal settings
if has('nvim')
  set guicursor=n-v-c:block,i-ci-ve:ver10,r-cr:hor20,o:hor50
        \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
        \,sm:block-blinkwait175-blinkoff150-blinkon175

  tnoremap <Leader>e <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-h>
  tnoremap <C-j> <C-\><C-n><C-j>
  tnoremap <C-k> <C-\><C-n><C-k>
  tnoremap <C-l> <C-\><C-n><C-l>
  let g:terminal_color_0 = '#928374'
endif

" Terminal {{{
" ====================================================================
  nnoremap <silent> <leader><Enter> :tabnew<CR>:terminal<CR>

" Opening splits with terminal in all directions
  nnoremap <leader>h<CR> :leftabove vnew<CR>:terminal<CR>
  nnoremap <leader>l<CR> :rightbelow vnew<CR>:terminal<CR>
  nnoremap <leader>k<CR> :leftabove new<CR>:terminal<CR>
  nnoremap <leader>j<CR> :rightbelow new<CR>:terminal<CR>
  "}}}
" ----------------------------------------------------------------------------
" Message output on vim actions
" ----------------------------------------------------------------------------
set shortmess+=t                      " truncate file messages at start
set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess-=l
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
 set shortmess-=f                      " (file x of x) instead of just (x of x)
" set shortmess+=I                      " no splash screen
" set shortmess+=mnrxoOt
if has('patch-7.4.314')
  set shortmess+=c                    " Disable 'Pattern not found' messages
endif

" ----------------------------------------------------------------------------
" Window splitting and buffers
" ----------------------------------------------------------------------------
" Set minimal width for current window.
set winwidth=30
set splitbelow "Open a horizontal split below current window
set splitright "Open a vertical split to the right of the window
if has('folding')
  if has('windows')
    set fillchars=vert:│                  " Vertical sep between windows (unicode)- ⣿
    set fillchars+=fold:-
  endif
  "set foldmethod=indent
  set foldlevelstart=99
  set foldnestmax=3           " deepest fold is 3 levels
endif
" reveal already opened files from the quickfix window instead of opening new
" buffers
" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
catch
endtry

if !has('nvim')
  set termsize="10x30"
endif
" ----------------------------------------------------------------------------
" DIFFING {{{
" ----------------------------------------------------------------------------

" Note this is += since fillchars was defined in the window config
set fillchars+=diff:⣿
set diffopt=vertical                  " Use in vertical diff mode
set diffopt+=filler                   " blank lines to keep sides aligned
set diffopt+=iwhite                   " Ignore whitespace changes
"}}}
" ----------------------------------------------------------------------------
"             FORMAT OPTIONS {{{
" ----------------------------------------------------------------------------
" Input auto-formatting (global defaults)
" Probably need to update these in after/ftplugin too since ftplugins will
" probably update it.
set formatoptions=
set formatoptions+=1
set formatoptions-=q                  " continue comments with gq"
set formatoptions-=c                  " Auto-wrap comments using textwidth
set formatoptions-=r                  " Do not continue comments by default
set formatoptions-=o                  " do not continue comment using o or O
set formatoptions+=n                  " Recognize numbered lists
set formatoptions+=2                  " Use indent from 2nd line of a paragraph
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
set nrformats-=octal " never use octal when <C-x> or <C-a>"
"}}}
" ----------------------------------------------------------------------------
" Vim Path
" ----------------------------------------------------------------------------
" set path+=** "Vim searches recursively through all directories and subdirectories
set path+=**/src/main/**,** " path set to some greedy globs and suffixesadd set to contain .js. This allows me to press gf (open file under cursor) on a require statement, and it will actually take me to the source (if it exists)
set suffixesadd+=.js
" set autochdir

" ----------------------------------------------------------------------------
" Wild and file globbing stuff in command mode {{{
" ----------------------------------------------------------------------------
" Use faster grep alternatives if possible
if executable('rg')
  " set grepprg=rg\ --vimgrep\ --no-heading
  set grepprg=rg\ --smart-case\ --vimgrep\ $*
  set grepformat^=%f:%l:%c:%m
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"pressing Tab on the command line will show a menu to complete buffer and file names
set wildchar=<Tab>
set wildmenu
set wildmode=full       " Shows a menu bar as opposed to an enormous list
set wildcharm=<C-Z>
nnoremap <leader><tab> :b <C-Z>
set wildignorecase " Ignore case when completing file names and directories
" Binary
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.jar,*.pyc,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Cache
set wildignore+=.sass-cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*.gem
" Temp/System
set wildignore+=*.*~,*~
set wildignore+=*.swp,.lock,.DS_Store,._*,tags.lock

"}}}
" ----------------------------------------------------------------------------
" Display {{{
" --------------------------------------------------------------------------
"syntax sync minlines=256 " update syntax highlighting for more lines increased scrolling performance
 set synmaxcol=1024 " don't syntax highlight long lines
set emoji
if has('linebreak') "Causes wrapped line to keep same indentation
  " This should cause lines to wrap around words rather than random characters
  set linebreak
  " let &showbreak='↳ ' " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
  let &showbreak='↪ '
  if exists('&breakindentopt')
    set breakindentopt=shift:2
  endif
endif
" LIST =============================================================
set list                              " show invisible chars
set listchars+=tab:▷\ 
set listchars+=precedes:←
set listchars+=extends:→
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set listchars+=eol:\ 
" =====================================================================
"-----------------------------------
" link to system clipboard
if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
" set magic " For regular expressions turn magic on
set gdefault "Makes the g flag available by default so it doesn't have to be specified
" insert completion height and options
set pumheight=10
"set completeopt-=preview " This prevents a scratch buffer from being opened
set title                             " wintitle = filename - vim
set number
if has('+relativenumber') "Add relative line numbers and relative = absolute line numbers i.e current
  set relativenumber
endif
if !has('gui_running')
  set linespace=4
else
  set linespace=2
endif
set numberwidth=5
set report=0 " Always show # number yanked/deleted lines
set smartindent "Turns on smart indent which can help indent files like html natively
set wrap
set textwidth=79
set nojoinspaces "Use one space, not two, after punctuation
set autowrite "Automatically :write before running commands
set backspace=2 "Back space deletes like most programs in insert mode
if has('vim')
  if has('+signcolumn')
    set signcolumn=yes "enables column that shows signs and error symbols
  endif
endif
set ruler
set incsearch
if !has('nvim')
  set ttyfast " Improves smoothness of redrawing when there are multiple windows
  set lazyredraw " Turns on lazyredraw which postpones redrawing for macros and command execution
else
  set nolazyredraw "Broken on neovim
endif
if exists('&belloff')
  set belloff=all                     " never ring the bell for any reason
endif
if has('termguicolors')
  set termguicolors " set vim-specific sequences for rgb colors super important for truecolor support in vim
  " if &term =~# 'tmux-256color' "Setting the t_ variables is a further step to ensure 24bit colors
  let &t_8f="\<esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<esc>[48;2;%lu;%lu;%lum"
  " endif
endif
"}}}
" ----------------------------------------------------------------------------

" ------------------------------------
" Command line
" ------------------------------------
set showcmd "Show commands being input
set cmdheight=2 " Set command line height to two lines
"-----------------------------------------------------------------
"Abbreviations
"-----------------------------------------------------------------
iabbrev w@ www.akin-sowemimo.com

"fugitive plugin
let g:EditorConfig_core_mode = 'external_command' " Speed up editorconfig plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"-----------------------------------------------------------
"Plugin configurations "{{{
"-----------------------------------------------------------------
nmap <silent> <leader>vt :TestNearest<CR>
nmap <silent> <leader>vT :TestFile<CR>
nmap <silent> <leader>va :TestSuite<CR>
nmap <silent> <leader>vl :TestLast<CR>
nmap <silent> <leader>vg :TestVisit<CR>


"TypeScript Tsuqoyomi settings
let g:tsuquyomi_definition_split = 2

let g:polyglot_disabled = ['elm', 'clojure' ]

let g:elm_format_autosave = 1
let g:elm_jump_to_error = 1
let g:elm_detailed_complete = 1
let g:elm_setup_keybindings = 0
let g:elm_make_output_file = "index.html"

"Removes highlighting in typescript
highlight YcmErrorSection gui=underline cterm=underline

let g:echodoc#enable_at_startup          = 1
if has("nvim")
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#auto_complete_delay = 0
  let g:nvim_typescript#javascript_support = 1
  let g:deoplete#file#enable_buffer_path   = 1
  let g:nvim_typescript#type_info_on_hold  = 1
  let g:deoplete#sources                   = {}
  let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
  let g:deoplete#sources['javascript.jsx'] = ['file', 'buffer', 'ultisnips', 'ternjs']
  let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = [
        \ 'tern#Complete',
        \ 'jspc#omni'
        \]
  let g:deoplete#omni#functions.typescript = [
        \ 'tern#Complete',
        \ 'jspc#omni'
        \]

  let g:deoplete#enable_at_startup = 1
  nnoremap <leader>tsp :TSDefPreview<CR>
  nnoremap <leader>tsr :TSRefs<CR>
  nnoremap <leader>tsd :TSDocs<CR>
  nnoremap <leader>tst :TSType<CR>
  nnoremap <leader>ets :TSEditConfig<CR>
  nnoremap <leader>tsi :TSImport<CR>
else
  let g:ycm_add_preview_to_completeopt          = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_seed_identifiers_with_syntax        = 1
  let g:ycm_collect_identifiers_from_tags_files = 1
  nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
  nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
  nnoremap <leader>gt :YcmCompleter GetType<CR>
endif
let g:tern_request_timeout = 1
"Add extra filetypes
let g:tern#filetypes = [
      \ 'tsx',
      \ 'typescript.jsx',
      \ 'typescript',
      \ 'javascript',
      \ 'jsx',
      \ 'javascript.jsx',
      \ ]
let g:tern_show_argument_hints                = '0'
let g:tern_map_keys                           = 1
let g:tern_show_signature_in_pum              = 1
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabLongestHighlight = 1
" or just disable the preview entirely
"set completeopt-=preview

"------------------------------------
" Goyo
"------------------------------------
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <F3> :Goyo<CR>
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set nonumber
  set scrolloff=999
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set number relativenumber
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Goyo
function! s:auto_goyo()
  if &ft == 'markdown' && winnr('$') == 1
    Goyo
  elseif exists('#goyo')
    Goyo!
  endif
endfunction

function! s:goyo_leave()
  if winnr('$') < 2
    silent! :q
  endif
endfunction

augroup goyo_markdown
  autocmd!
  autocmd BufNewFile,BufRead * call s:auto_goyo()
  autocmd! User GoyoLeave nested call s:goyo_leave()
augroup END

let g:vim_markdown_fenced_languages =['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=json', 'ruby', 'sass', 'scss=sass', 'xml', 'html', 'python', 'stylus=css', 'less=css', 'sql']
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_folding_disabled           = 1 " Stop folding markdown please

let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"
let g:UltiSnipsEditSplit="vertical" "If you want :UltiSnipsEdit to split your window.

let delimitMate_expand_cr          = 2
let delimitMate_expand_space       = 1
let delimitMate_balance_matchpairs = 1
" ================================================
" FZF
" ================================================
if !has('gui_running')
  nnoremap <localleader>m  :Marks<CR>
  nnoremap <localleader>mm :Maps<CR>

  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit' }

  " Customize fzf colors to match your color scheme
  let g:fzf_colors =
        \ { 'fg':    ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }

" Files + devicons
function! Fzf_dev()
  function! s:files()
    let files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(files)
  endfunction

  function! s:prepend_icon(candidates)
    let result = []
    for candidate in a:candidates
      let filename = fnamemodify(candidate, ':p:t')
      let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
      call add(result, printf("%s %s", icon, candidate))
    endfor

    return result
  endfunction

  function! s:edit_file(item)
    let parts = split(a:item, ' ')
    let file_path = get(parts, 1, '')
    execute 'silent e' file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m -x +s',
        \ 'down':    '40%' })
endfunction

endif
"JS Docs plugin
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
nmap <silent> co <Plug>(jsdoc)

if exists('NERDTree') " after a re-source, fix syntax matching issues (concealing brackets):
  if exists('g:loaded_webdevicons')
    call webdevicons#hardRefresh()
  endif
endif
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tsx'] = '' " Set tsx extension icon to same as ts
let g:DevIconsEnableFoldersOpenClose = 1

let g:startify_list_order = [
      \ ['   😇 My Sessions:'],
      \ 'sessions',
      \ ['   MRU Files:'],
      \ 'files',
      \ ['   MRU files in current directory:'],
      \ 'dir',
      \ ['   My Bookmarks:'],
      \ 'bookmarks',
      \ ['   Commands:'],
      \ 'commands',
      \ ]

let g:startify_session_dir = '~/.vim/session'
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1

" =========================================================================

"This sets default mapping for camel case text object
call camelcasemotion#CreateMotionMappings('<leader>')
"   Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
"   saves on moving pane but only the currently opened buffer if changed
let g:tmux_navigator_save_on_switch = 2

"Remaps native insert mode paste binding to alt-p
inoremap ð <C-R>0
inoremap … <C-R><C-P>0

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""
" => HELPER FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
if !has("nvim")
  let &t_SI .= WrapForTmux("\<Esc>[?2004h")
  let &t_EI .= WrapForTmux("\<Esc>[?2004l")
endif

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('html', 202, 'none', '#FC4709')
call NERDTreeHighlightFile('hbs', 202, 'none', '#FC4709')
call NERDTreeHighlightFile('jade', 149, 'none', '#A0D24D')
call NERDTreeHighlightFile('json', 223, 'none', '#FECEA0')
call NERDTreeHighlightFile('scss', 44, 'none', '#db7093')
call NERDTreeHighlightFile('css', 44, 'none', '#db7093')
call NERDTreeHighlightFile('js', 226, 'none', '#FFD700')
call NERDTreeHighlightFile('ts', 226, 'none', '#FFD700')
call NERDTreeHighlightFile('rb', 197, 'none', '#E53378')
call NERDTreeHighlightFile('md', 208, 'none', '#FD720A')
call NERDTreeHighlightFile('jsx', 140, 'none', '#9E6FCD')
call NERDTreeHighlightFile('svg', 178, 'none', '#CDA109')
call NERDTreeHighlightFile('gif', 36, 'none', '#15A274')
call NERDTreeHighlightFile('jpg', 36, 'none', '#15A274')
call NERDTreeHighlightFile('png', 36, 'none', '#15A274')
"-----------------------------------------------------------
"Colorscheme
"-----------------------------------------------------------
set background=dark
colorscheme quantum
if has('nvim')
  let g:terminal_color_0  = '#ffffff'
  let g:terminal_color_15 = '#eeeeec'
endif

"if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  "set t_ut=
"endif
set conceallevel=2
"====================================================================================
"Spelling & Highlights
"====================================================================================
" Change default highlighting for spellbad, the default is really bad
highlight clear SpellBad
highlight SpellBad  term=underline cterm=italic ctermfg=Red
highlight clear SpellCap
highlight SpellCap  term=underline cterm=italic ctermfg=Blue
highlight clear SpellLocal
highlight SpellLocal  term=underline cterm=italic ctermfg=Blue
highlight clear SpellRare
highlight SpellRare  term=underline cterm=italic ctermfg=Blue
highlight clear Conceal "Sets no highlighting for conceal
"few nicer JS colours
highlight xmlAttrib cterm=italic,bold ctermfg=121
highlight jsThis ctermfg=224
highlight jsSuper ctermfg=13
highlight jsFuncCall ctermfg=cyan
highlight jsClassProperty ctermfg=14 cterm=bold
"highlight jsComment ctermfg=245 ctermbg=none
highlight htmlArg gui=italic,bold cterm=italic,bold ctermfg=yellow
highlight Comment gui=italic cterm=italic
highlight Type    gui=italic cterm=italic
highlight Folded guifg=#FFC66D guibg=NONE
highlight CursorLine term=none cterm=none
"make the completion menu a bit more readable
highlight PmenuSel guibg=black guifg=white
highlight Pmenu guibg=white guifg=black
"so it's clear which paren I'm on and which is matched
highlight MatchParen cterm=bold ctermbg=none guifg=green guibg=NONE
highlight Search ctermbg=NONE guifg=NONE guibg=NONE
"highlight VertSplit guifg=black ctermfg=black
"Remove Background color
if !has('gui_running')
  highlight Normal ctermbg=NONE guibg=NONE
endif
if has('gui_running')
  hi VertSplit guibg=bg guifg=bg
endif
" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" Highlight term cursor differently
if has('nvim')
  highlight TermCursor ctermfg=green guifg=green
endif
"---------------------------------------------------------------------
" Utilities
"---------------------------------------------------------------------
set noshowmode "No mode showing in command pane
set updatetime=2000
if has('virtualedit')
  set virtualedit=block               " allow cursor to move where there is no text in visual block mode
endif
" ----------------------------------------------------------------------------
" Tabbing - overridden by editorconfig, after/ftplugin {{{
" ----------------------------------------------------------------------------
set expandtab                         " default to spaces instead of tabs
set shiftwidth=2                      " softtabs are 2 spaces for expandtab
set softtabstop=-2 " Alignment tabs are two spaces, and never tabs. Negative means use same as shiftwidth (so the 2 actually doesn't matter).
set tabstop=8 " real tabs render width. Applicable to HTML, PHP, anything using real tabs. I.e., not applicable to JS.
set noshiftround " use multiple of shiftwidth when shifting indent levels. this is OFF so block comments don't get fudged when using \">>" and \"<<"
set smarttab " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'. 'tabstop' or 'softtabstop' is used in other places.
" set complete+=k " Add dictionary to vim's autocompletion
if !has('nvim')
  set complete-=i
  set autoindent
endif
set display+=lastline
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
scriptencoding utf-8

" =======================================================
"  DICTIONARY
" =======================================================
 set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif
set autoread " reload files if they were edited elsewhere

set history=100
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
"-----------------------------------------------------------------------------
" BACKUP AND SWAPS
"-----------------------------------------------------------------------------
"Turn swap files off - FOR GOD's SAKE they are ruining my life
set noswapfile
"This saves all back up files in a vim backup directory
if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
else
  set backupdir=~/.vim/.backup//
  set backupdir+=~/local/.vim/tmp/backup
  set backupdir+=~/.vim/tmp/backup    " keep backup files out of the way
endif

" set directory=~/.vim/.swp//
if has ('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile "Dont add root owned files which I will need to sudo to remove
  else
    set undodir=~/.vim/.undo//
    set undodir+=~/local/.vim/tmp/undo
    set undodir+=.
    set undofile
  endif
endif

if has("vms")
  set nobackup
else
  set backup
endif
"}}}
" ----------------------------------------------------------------------------
" Match and search
" ----------------------------------------------------------------------------
" Sets a case insensitive search except when using Caps
set ignorecase
set smartcase
set wrapscan " Searches wrap around the end of the file
set nohlsearch " -functionality i.e. search highlighting done by easy motion and incsearch
if &ft ==# 'html'
  set matchpairs+=<:> "setting is super annoying if not html
endif
" ----------------------------------------------------------------------------
" CURSOR  "{{{
" ----------------------------------------------------------------------------
" Set cursorline to the focused window only and change and previously color/styling of cursor line depending on mode - Slow?
augroup cursorline
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

set scrolloff=10 " Show context around current cursor position i.e. cursor lines remaining whilst moving up or down As this is set to a large number the cursor will remain in the middle of the page on scroll (8 ) was the previous value
set sidescrolloff=10
set nostartofline " Stops some cursor movements from jumping to the start of a line

"}}}

