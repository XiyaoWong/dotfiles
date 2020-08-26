""---------------------------------------------------------------------------//
" FUGITIVE
""---------------------------------------------------------------------------//
function s:create_new_branch() abort
  " TODO add a new line at the end of the input
  " consider highlighting for bonus point
  let branch = input("Enter new branch name: ")
  if strlen(branch)
    redraw " clear the input message we just added
    execute 'Git checkout -b ' . branch
  endif
endfunction

function! s:setup() abort
  nnoremap <expr><buffer> } filter([search('\%(\_^#\?\s*\_$\)\\|\%$', 'W'), line('$')], 'v:val')[0].'G'
  nnoremap <expr><buffer> { max([1, search('\%(\_^#\?\s*\_$\)\\|\%^', 'bW')]).'G'

  if expand('%') =~# 'COMMIT_EDITMSG'
    setlocal spell
    " delete the commit message storing it in "g, and go back to Gstatus
    nnoremap <silent><buffer> Q gg"gd/#<cr>:let @/=''<cr>:<c-u>wq<cr>:Gstatus<cr>:call histdel('search', -1)<cr>
    " Restore register "g
    nnoremap <silent><buffer> <leader>u gg"gP
  endif
endfunction

command! -nargs=0 Gcm :G checkout master
command! -nargs=1 Gcb :G checkout -b <q-args>

"Fugitive bindings
nnoremap <silent><localleader>gs  :Git<CR>
"Stages the current file
nnoremap <silent><localleader>gw  :Gwrite<CR>
"Revert current file to last checked in version
nnoremap <silent><localleader>gre :Gread<CR>
"Remove the current file and the corresponding buffer
nnoremap <silent><localleader>grm :GRemove<CR>
" See in a side window who is responsible for lines of code
" can also set the date=relative but this breaks rendering
" and shortcuts
nnoremap <silent><localleader>gbl :Git blame --date=short<CR>
" Blame specific visual range
vnoremap <silent><localleader>gbl :Gblame --date=short<CR>
nnoremap <silent><localleader>gd  :Gdiffsplit<CR>
nnoremap <silent><localleader>gc  :Git commit<CR>
nnoremap <silent><localleader>gcm :Gcm<CR>
nnoremap <silent><localleader>gn  :call <SID>create_new_branch()<CR>
nnoremap <silent><localleader>gm  :Git mergetool<CR>
" command is not silent as this obscures the preceding command
" also not the use of <c-z> the wildcharm character to trigger completion
nnoremap <localleader>go :Git checkout<space><C-Z>

augroup vimrc_fugitive
  autocmd!
  autocmd FileType gitcommit call s:setup()
augroup END
