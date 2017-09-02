"-----------------------------------------------------------
"PLUGINS {{{
"-----------------------------------------------------------
"This will autoinstall vim plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup VimPlug
    au!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif
function! Cond(cond, ...)
  let l:opts = get(a:000, 0, {})
  return a:cond ? l:opts : extend(l:opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')
"NVIM ====================================
" Deoplete
" ----------------------------------------
Plug 'Shougo/deoplete.nvim',        Cond(has('nvim'), { 'do': ':UpdateRemotePlugins' })
Plug 'carlitux/deoplete-ternjs',    Cond(has('nvim'), { 'do': 'npm install -g tern' })
Plug 'ujihisa/neco-look',           Cond(has('nvim'), { 'for': 'markdown' }) "English completion
Plug 'Shougo/neco-vim',             Cond(has('nvim'), { 'for': 'vim' })
Plug 'zchee/deoplete-go',           Cond(has('nvim'), { 'do': 'make'})
Plug 'pbogut/deoplete-elm',         Cond(has('nvim'), { 'for': 'elm' })
Plug 'mhartington/nvim-typescript', Cond(has('nvim'))
Plug 'wellle/tmux-complete.vim'   , Cond(exists('$TMUX'))
"================================{{{
Plug 'maralla/completor.vim', Cond(!has('nvim'))
Plug 'Quramy/tsuquyomi',      Cond(!has('nvim'))
Plug 'w0rp/ale' " Ale  Async Linting as you type
Plug 'SirVer/ultisnips'
Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/nerdtree', {'on':['NERDTreeFind', 'NERDTreeToggle']}
Plug 'mattn/emmet-vim'
Plug 'cohama/lexima.vim'
Plug 'easymotion/vim-easymotion'
function! BuildTern(info)
  if a:info.status ==# 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'ternjs/tern_for_vim', Cond(has('nvim'), {'do':function('BuildTern')})
Plug 'mhinz/vim-startify'
if !has('gui_running')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        \ | Plug 'junegunn/fzf.vim'
endif
Plug 'junegunn/vim-easy-align', { 'on': [ '<Plug>(EasyAlign)' ] }
"}}}
"TMUX ============================
Plug 'christoomey/vim-tmux-navigator' "Navigate panes in vim and tmux with the same bindings
"Utilities ============================{{{
Plug 'mbbill/undotree',{'on':['UndotreeToggle']} "Add Gundo - undo plugin for vim
Plug 'chip/vim-fat-finger', { 'on':[] } "Autocorrects 4,000 common typos
augroup load_fat_finger
  autocmd!
  autocmd InsertEnter * call plug#load('vim-fat-finger')
        \| autocmd! load_fat_finger
augroup END
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-sayonara'
"}}}
"TPOPE ===================================={{{
"Very handy plugins and functionality by Tpope (ofc)
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive' " Add fugitive git status and command plugins
Plug 'tpope/vim-eunuch' " Adds file manipulation functionality
Plug 'tpope/vim-repeat' " . to repeat more actions
Plug 'tpope/vim-abolish'
"}}}
"Syntax ============================{{{
Plug 'ianks/vim-tsx'
Plug 'sheerun/vim-polyglot'
Plug 'othree/javascript-libraries-syntax.vim', { 'for':[
      \ 'javascript',
      \ 'typescript'
      \ ] }
Plug 'editorconfig/editorconfig-vim'
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'ap/vim-css-color', { 'for': [
      \ 'typescript.tsx'
      \ ,'javascript.jsx'
      \ , 'css'
      \ , 'javascript'
      \ , 'typescript'
      \ ] }
"}}}
"Git ==============================={{{
Plug 'airblade/vim-gitgutter'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'jreybert/vimagit'
Plug 'lambdalisue/gina.vim'
"}}}
"Text Objects ====================={{{
Plug 'tommcdo/vim-exchange'
Plug 'bkad/CamelCaseMotion'
Plug 'wellle/targets.vim'
Plug 'kana/vim-smartword'
Plug 'kana/vim-textobj-user'
      \ | Plug 'whatyouhide/vim-textobj-xmlattr'
      \ | Plug 'glts/vim-textobj-comment'
      \ | Plug 'terryma/vim-expand-region'
      \ | Plug 'paulhybryant/vim-textobj-path'
      \ | Plug 'kana/vim-textobj-function'
        \ | Plug 'thinca/vim-textobj-function-javascript'
"}}}
"Search Tools =======================
Plug 'dyng/ctrlsf.vim'
Plug 'kopischke/vim-fetch' "Allows GF to open vim at a specific line
Plug 'airblade/vim-rooter'
Plug 'rhysd/devdocs.vim'
"Coding tools ======================={{{
Plug 'matze/vim-move'
Plug 'janko-m/vim-test'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdcommenter'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/goyo.vim'
Plug 'c0r73x/neotags.nvim', Cond(has('nvim'))
Plug 'KabbAmine/vCoolor.vim', { 'on': ['VCoolor', 'VCase'] }
Plug 'kassio/neoterm', Cond(has('nvim'))
"}}}
"Filetype Plugins ======================{{{
function! BuildComposer(info)
  if a:info.status !=# 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' } "Go for Vim
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
"}}}
"Themes =============================== {{{
Plug 'rhysd/try-colorscheme.vim', {'on':'TryColorscheme'}
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' " This Plugin must load after the others - Add file type icons to vim
call plug#end()
""---------------------------------------------------------------------------//
" Colorscheme ideas
""---------------------------------------------------------------------------//
" Plug 'mhartington/oceanic-next'
" Plug 'rakr/vim-one'
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &runtimepath) ==# ''
  runtime! macros/matchit.vim
endif

" Don't use netrw at all, interferes with "clever" autocommands
let g:loaded_netrwPlugin = 1
"}}}
