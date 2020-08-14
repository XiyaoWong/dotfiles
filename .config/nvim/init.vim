" ________  ___  __    ___  ________   ________           ________  ________  ________   ________ ___  ________
" |\   __  \|\  \|\  \ |\  \|\   ___  \|\   ____\         |\   ____\|\   __  \|\   ___  \|\  _____\\  \|\   ____\
" \ \  \|\  \ \  \/  /|\ \  \ \  \\ \  \ \  \___|_        \ \  \___|\ \  \|\  \ \  \\ \  \ \  \__/\ \  \ \  \___|
" \ \   __  \ \   ___  \ \  \ \  \\ \  \ \_____  \        \ \  \    \ \  \\\  \ \  \\ \  \ \   __\\ \  \ \  \  ___
"  \ \  \ \  \ \  \\ \  \ \  \ \  \\ \  \|____|\  \        \ \  \____\ \  \\\  \ \  \\ \  \ \  \_| \ \  \ \  \|\  \
"   \ \__\ \__\ \__\\ \__\ \__\ \__\\ \__\____\_\  \        \ \_______\ \_______\ \__\\ \__\ \__\   \ \__\ \_______\
"    \|__|\|__|\|__| \|__|\|__|\|__| \|__|\_________\        \|_______|\|_______|\|__| \|__|\|__|    \|__|\|_______|
"                                        \|_________|
" Each section of my config has been separated out into subsections in ./configs/
filetype off " required  Prevents potential side-effects from system ftdetects scripts

"---------------------------------------------------------------------------//
" Config Loader
"---------------------------------------------------------------------------//
augroup vimrc "Ensure all autocommands are cleared
  autocmd!
augroup END

" The operating system is assigned to a global variable that
" that can be used elsewhere for conditional system based logic
if has('mac')
  let g:open_command = 'open'
elseif has('unix')
  let g:open_command = 'xdg-open'
endif

" WARNING: Hard coding the location of my dotfiles is brittle
let g:dotfiles = strlen($DOTFILES) ? $DOTFILES : '~/.dotfiles'
let g:vim_dir = g:dotfiles . '/.config/nvim'

function! VimrcMessage(msg) abort
  echohl WarningMsg
  echom a:msg
  echohl none
endfunction
"-----------------------------------------------------------------------
"Leader bindings
"-----------------------------------------------------------------------
let g:mapleader      = ',' "Remap leader key
let g:maplocalleader = "\<space>" "Local leader key MUST BE DOUBLE QUOTES
"-----------------------------------------------------------------------
" Essential Settings - Taken care of by Vim Plug
"-----------------------------------------------------------------------
filetype plugin indent on
syntax enable

"-----------------------------------------------------------------------
" Local vimrc
"-----------------------------------------------------------------------
let s:vimrc_local = $HOME.'/.vimrc.local'
if filereadable(s:vimrc_local)
  source s:vimrc_local
endif
" ----------------------------------------------------------------------
" Plugin Configurations
" ----------------------------------------------------------------------
" Order matters here as the plugins should be loaded before the other setup
" :h runtime - this fuzzy maches files within vim's runtime path
runtime /configs/preload.vim
runtime /configs/plugins.vim
runtime /configs/general.vim
runtime /configs/highlight.vim
runtime /configs/mappings.vim
runtime /configs/autocommands.vim
runtime /configs/statusline.vim

runtime! /configs/plugins/*.vim
"---------------------------------------------------------------------------//
