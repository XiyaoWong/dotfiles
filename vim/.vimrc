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
"This command makes vim start a file with all folds closed
set foldlevelstart=0
"-----------------------------------------------------------
"Plugins
"-----------------------------------------------------------{{{
"This will autoinstall vim plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
"set the runtime path to include Vundle and initialise
call plug#begin('~/.vim/plugged')
let g:ycm_confirm_extra_conf = 0

"Added YouCompleteMe autocompleter
" function! BuildYCM(info)
"   if a:info.status == 'installed' || a:info.force
"     !./install.sh
"   endif
" endfunction
" {'do':function('BuildYCM')}
Plug 'Valloric/YouCompleteMe',{ 'do': './install.py' }
"Added nerdtree filetree omnitool : )
Plug 'scrooloose/nerdtree'
" , { 'on':  'NERDTreeToggle' }
"Added vim surround for enclosing with parens
Plug 'tpope/vim-surround'
"Added jsbeautify
Plug 'maksimr/vim-jsbeautify'
" Add fugitive git status and command plugins
Plug 'tpope/vim-fugitive'
" Adds file manipulation functionality
Plug 'tpope/vim-eunuch'
"Added Editor Config plugin to maintain style choices
Plug 'editorconfig/editorconfig-vim'
"Commenting plugin
Plug 'tomtom/tcomment_vim'
"Added nerdcommenter for commenting out text - currently not working
" Plug 'scrooloose/nerdcommenter' 
"Added emmet vim plugin
Plug 'mattn/emmet-vim'
"Added delimit me auto parens plugin
Plug 'Raimondi/delimitMate'
"Added further javascript syntax highlighting
Plug 'jelera/vim-javascript-syntax',{'for':'javascript'}
"Added node.vim plugin
Plug 'moll/vim-node'
"Added javascript lib - syntax highlighting for popular libraries
Plug 'othree/javascript-libraries-syntax.vim'
" Added yet another js syntax highlighter - Better performance
" Plug 'othree/yajs.vim',{'for':'javascript'}
"Added easy motions
Plug 'easymotion/vim-easymotion'
"Added vim polyglot a collection of language packs for vim
Plug 'sheerun/vim-polyglot'
"Added vim snippets for code autofilling
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6'
Plug 'jamescarr/snipmate-nodejs'
"Autocorrects 4,000 common typos
Plug 'chip/vim-fat-finger'
"Autosuggestions for function parameters like click, mouseover
Plug 'othree/jspc.vim'
" Adds syntax completion for things like canvas and chrome APIs
Plug '1995eaton/vim-better-javascript-completion'
"Added SyntaxComplete for more syntax completion
Plug 'vim-scripts/SyntaxComplete'
"Add proper markdown syntax and indentation plugin
Plug 'gabrielelana/vim-markdown'
"Markdown previewer
Plug 'JamshedVesuna/vim-markdown-preview'
"Added color picker plugin
Plug 'KabbAmine/vCoolor.vim'
"Add Tern for autocompletion
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
   !npm install
  endif
endfunction
Plug 'ternjs/tern_for_vim',{'do':function('BuildTern')}
"Add Gundo - undo plugin for vim
Plug 'sjl/gundo.vim'
"Add buffergator for better buffer control
Plug 'jeetsukumaran/vim-buffergator'
"Tim pope's surround plugin allows . to repeat more actions
Plug 'tpope/vim-repeat'
"Added yankstack a lighter weight version of yankring
Plug 'maxbrunsfeld/vim-yankstack'
"Add supertab to use tab for all insert mode completions
" Plug 'ervandew/supertab'
"Navigate panes in vim and tmux with the same bindings
Plug 'christoomey/vim-tmux-navigator'
" A fun start up sceen for vim
Plug 'mhinz/vim-startify'
"FZF improved wrapper by June Gunn + the man who maintains syntastic
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'
"React Snippets since I can't get the defaults to work
Plug 'justinj/vim-react-snippets'
"Excellent terminal integration for vim
" Plug 'wincent/terminus'
" Autoformatter
Plug 'Chiel92/vim-autoformat'
"Add a GitGutter to track new lines re git file
Plug 'airblade/vim-gitgutter'
"Plug to create diff window and Gstatus window on commit
Plug 'rhysd/committia.vim'
"Vimux i.e send commands to a tmux split
Plug 'benmills/vimux'
"Vim signature re-added because I need to see my bloody marks
Plug 'kshenoy/vim-signature'
"Vim obsession Tpope's amazing plugin for managing sessions
Plug 'tpope/vim-obsession'
"TPope tag plugin
Plug 'tpope/vim-ragtag'
"vim sialoquent theme
Plug 'davidklsn/vim-sialoquent'
"Colorsheme solarized 8
Plug 'lifepillar/vim-solarized8'
"Colorscheme - OneDark
Plug 'joshdick/onedark.vim'
" Neomake async linting
Plug 'neomake/neomake'



"Text object library plugin for defining your own text objects
Plug 'kana/vim-textobj-user'
"Text object for closest inner (),{} or [] 
Plug 'Julian/vim-textobj-brace'
"Text obj for comments 
Plug 'glts/vim-textobj-comment'
" Add text objects form camel cased strings (should be native imho)
Plug 'bkad/CamelCaseMotion' "uses a prefix of the leader key to implement text objects e.g. ci<leader>w will change all of one camelcased word
" Add text objects for function arguments = a i.e caa change an argument
Plug 'vim-scripts/argtextobj.vim'
" Add text object for indented code = 'i' i.e dii delete inner indented block
Plug 'michaeljsmith/vim-indent-object'
" Text object for manipulating chunks
Plug 'Chun-Yang/vim-textobj-chunk'
"Add JSDocs plugin
Plug 'heavenshell/vim-jsdoc'
"Add Tagbar Plugin
Plug 'majutsushi/tagbar'
"Add Plugin to manage tag files
Plug 'ludovicchabant/vim-gutentags'
"Vim HARDMODE ----------------------
Plug 'wikitopian/hardmode'
"Another attempt at implementing lightline
Plug 'itchyny/lightline.vim'
"Add ligtline buffers
Plug 'taohex/lightline-buffer'
" A plugin for managing vim themes
Plug 'reedes/vim-thematic'
" toggles line numbering depending on current mode
Plug 'myusuf3/numbers.vim'

"Add Vim-Quickfix window plugin for managing basic qf functionality
" Plug 'romainl/vim-qf'
"Added vim airline
" Plug 'vim-airline/vim-airline'
"Added airline themes"
" Plug 'vim-airline/vim-airline-themes'
" NVIM colorscheme
" Plug 'rakr/vim-one'
"Closes tags with > command
" Plug 'alvan/vim-closetag'
"Added vim javascript - this is automatically included in vim polyglot
" Plug 'pangloss/vim-javascript'
" Add new theme trial purposes ofc
" Plug 'rhysd/vim-color-spring-night'
"Added oceanic next theme
" Plug 'mhartington/oceanic-next'
" Added html5 syntax highlighter - vim polyglot includes this by default
" Plug 'othree/html5.vim'
"Add context higlighting for JS depending on function scope
" Plug 'bigfish/vim-js-context-coloring',{'do': 'npm install --update'}

"Add file type icons to vim
Plug 'ryanoasis/vim-devicons' " This Plugin must load after the others



call plug#end()

filetype plugin indent on

"Added built in match it plugin to vim
packadd! matchit

"!!!This line is key to making vim work in tmux
if !has('gui_running') && !has('nvim')
  set term=screen-256color
endif

  syntax enable
"}}}
"====================================================================================
"Leader bindings
"====================================================================================

"Remap leader key
let mapleader = ","
"Local leader key
let maplocalleader = "\<space>"
"/"
"--------------------------------------------------------------------------------------------------
"Plugin Mappings
"--------------------------------------------------------------------------------------------------{{{
set conceallevel=1
" set foldmethod=manual
nnoremap ¬ :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
let g:javascript_conceal_arrow_function = "⇒"


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


"Toggle Tagbar
nnoremap <leader>2 :TagbarToggle<CR>

"Vimux ==========================================================
"Tell vimux to run commands in a new split
let VimuxUseNearest = 1
nnoremap <F5> :call VimuxRunCommand('browse')<CR>
" Prompt for a command to run
nnoremap <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
nnoremap <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
nnoremap <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
 nnoremap <Leader>vz :call VimuxZoomRunner()<CR>



"Vim-Signature ==================================================
" let g:SignatureMap['Leader'] = '<LocalLeader>'

let g:SignatureMarkTextHLDynamic=1
nnoremap [1 :call signature#marker#Goto('next', 1, v:count)
nnoremap ]1 :call signature#marker#Goto('prev', 1, v:count)
"NERDTree
" =============================================
" Ctrl+N to toggle Nerd Tree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeCascadeOpenSingleChildDir=1
let g:NERDTreeShowBookmarks = 1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowHidden=1 "Show hidden files by default

"Press enter to complete suggestions - turned off
let g:SuperTabCrMapping = 1


let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_toggle=2

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
"Use easy motion to search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" Jump to anwhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Bidirectional & within line 't' motion
" omap t <Plug>(easymotion-bd-tl)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"===================================================

"Mapped yank stack keys
let g:yankstack_map_keys = 0
let g:yankstack_yank_keys = ['y', 'd']
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe. - need to rethink this mapping
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<localleader><tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"YouCompleteMe configurations
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_always_populate_location_list = 1
"add Vcoolor color picker mapping
let g:vcoolor_map = '<C-0>'

"=======================================================================
"                    EMMET for Vim
"=======================================================================
"Use emmet only for html and css files - Great config option although having
"emmet when writing jsx is super helpful, so I just changed the bindings
" let g:user_emmet_install_global = 0
" augroup Emmet
"   au!
" autocmd Filetype html,css EmmetInstall
" autocmd Filetype html,css imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" augroup END
"Emmet for vim leader keymap
let g:user_emmet_leader_key="<c-y>"


"Add mapping for Gundo vim
nnoremap <leader>u :GundoToggle<CR>

"Color the sign column dark grey by default
" highlight SignColumn guibg=darkgrey

"NerdCommenter config
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1


"Set up libraries to highlight with library syntax highlighter
let g:used_javascript_libs = 'underscore,jquery,angularjs,react,jasmine,chai,handlebars'
"}}}
"====================================================================================
"Autocommands
"==================================================================================={{{
"JS Beautifier commands
"Visual mode mappings to beautify a range of files
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
"Normal mode mappings to beautify all of a file
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" augroup textobj_quote
"   autocmd!
"   autocmd FileType markdown call textobj#quote#init()
"   autocmd FileType textile call textobj#quote#init()
"   autocmd FileType text call textobj#quote#init({'educate': 0})
" augroup END
augroup formatting - excellent function but implemented by terminus
  autocmd!
  " automatically check for changed files outside vim
  autocmd bufread,bufenter,focusgained * silent! checktime
augroup end

augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END



"Saves files on switching tabs i.e losing focus
au FocusLost * :wa
augroup VimResizing
  au!
  "Command below makes the windows the same size on resizing !? Why
  " autocmd VimResized * wincmd =
  autocmd VimResized * :redraw! | :echo 'Redrew'
augroup END


  augroup filetype_css
  autocmd!
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
augroup END


augroup filetype_javascript
  autocmd!
  " autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType javascript :iabbrev <buffer> elif else if(){<CR>}<esc>3hi
  autocmd FileType javascript :iabbrev <buffer> iff if(){<CR>}<esc>hi

  autocmd FileType javascript :iabbrev <buffer> els else {<CR>}<esc>hi
  autocmd FileType javascript :iabbrev <buffer> cons console.log()

  autocmd FileType javascript :iabbrev <buffer> und undefined
  autocmd FileType javascript,javascript.jsx setlocal foldmethod=indent foldlevel=1
  autocmd FileType js UltiSnipsAddFiletypes javascript-mocha javascript.es6.react
  "don't use cindent for javascript
  autocmd Filetype javascript setlocal nocindent
  autocmd Filetype javascript setlocal foldlevelstart=1
augroup END


augroup FileType_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
  autocmd BufNewFile, BufRead *.html setlocal nowrap :normal gg:G
augroup END

augroup FileType_markdown
  autocmd!
  autocmd BufNewFile, BufRead *.md setlocal spell spelllang=en_uk "Detect .md files as mark down
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.md :onoremap <buffer>ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd BufNewFile,BufRead *.md :onoremap <buffer>ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
  autocmd BufNewFile,BufRead *.md :onoremap <buffer>aa :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
  autocmd BufNewFile,BufRead *.md :onoremap <buffer>ia :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
augroup END

augroup filetype_vim
  "Vimscript file settings -------------------------
  au!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup FileType_text
  autocmd!
  autocmd FileType text setlocal textwidth=78
augroup END

augroup FileType_all
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

"Close vim if only window is a Nerd Tree
augroup FileType_all
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END


augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END




" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
"}}}
"====================================================================================
"Spelling
"====================================================================================

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell
"Add spell checking local
" setlocal spell spelllang=en_us
"-----------------------------------------------------------------------------------
  "Mappings
"-----------------------------------------------------------------------------------{{{
" Line completion - native vim
inoremap ç <C-X><C-L>
"Close a buffer
nnoremap œ <C-W>q
"Replace current word with last deleted word
nnoremap S diw"0P
"Toggle case in insert and normal mode

" nnoremap ;u mzg~iw`z
" inoremap ;u _<Esc>mza<C-Right><Esc>bg~iw`zi<Del>
" make last typed word uppercase
inoremap ;u <esc>viwUea
" make . work with visually selected lines
vnoremap . :norm.<CR>

"Maps moving to match as moving and visually selecting along the way
nnoremap % v%
nnoremap ß :update<CR>
inoremap ß <esc>:update<CR>

"Control-m has this functionality natively
" inoremap <M-o>       <Esc>o
" inoremap ø       <Esc>o
let g:ragtag_global_maps = 1

"This mapping alternates between variants of number and relative number
nnoremap <F2> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
"This mapping allows yanking all of a line without taking the new line
"character as well can be with our without spaces
vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!^vg_<cr>
onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>
"ctrl-o in insert mode allows you to perform one normal mode command then
"returns to insert mode
inoremap <C-j> <Down>
inoremap <C-h> <left>
inoremap <C-k> <up>
inoremap <C-l> <right>


" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap <F4> :! open %<CR><CR>
nnoremap <F3> :!open -a safari %<CR><CR>
"Paste mode for large block of external text - Terminus plugin doees this
"automatically at present
set pastetoggle=<F1>
"time out on mapping after half a second, time out on key codes after a tenth
"of a second
set timeout timeoutlen=500 ttimeoutlen=100

" Remap jumping to the lask spot you were editing previously to bk as this is
" easier form me to remember
nnoremap bk `.

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
"--------------------------------------------
" FZF bindings
"--------------------------------------------
nnoremap <silent> <localleader>o :Buffers<CR>
" Launch file search using FZF
nnoremap <C-P> :FZF <CR>
nnoremap <leader>\ :Ag<CR>
"--------------------------------------------
" These two mappings reduce a sequence of empty (;b) or blank (;n) lines into a
" single line
nnoremap ;b   GoZ<Esc>:g/^$/.,/./-j<CR>Gdd
nnoremap ;n   GoZ<Esc>:g/^[ <Tab>]*$/.,/[^ <Tab>]/-j<CR>Gdd

" Zoom current split
nnoremap <leader>1 <C-W><Bar>
" nnoremap  <leader>2 <C-W>_
" Quick find/replace
nnoremap <Leader>[ :%s/<C-r><C-w>/
vnoremap <Leader>[ "zy:%s/<C-r><C-o>"/

"This allows me to use control-j to jump out of a newly matched pair (courtesty
"of delimitmate)
imap <C-F> <C-g>g
"--------------------------------------------
"Absolutely fantastic function from stoeffel/.dotfiles which allows you to
"repeat macros across a visual range
"--------------------------------------------
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
"--------------------------------------------

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
"Help Command - vertical split
command! -complete=help -nargs=1 H call VerticalHelp(<f-args>)
function! VerticalHelp(topic)
    execute "vertical botright help " . a:topic
    execute "vertical resize 78"
  endfunction
"--------------------------------------------
"Fugitive bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
"--------------------------------------------
"Remap back tick for jumping to marks more quickly
nnoremap ' `
nnoremap ` '

nnoremap rs ^d0
nnoremap qa :wqa<CR>
" clean up any trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
"Save all files
nnoremap <localleader>s :wa<bar>echo'Saved!'<CR>
"open a new file in the same directory
nnoremap <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>

"Open command line window
nnoremap <localleader>c :<c-f>

nnoremap <localleader>l :redraw!<cr>
"--------------------------------------------
" Window resizing bindings
"--------------------------------------------
"
"Create a horizontal split
nnoremap _ :sp<CR>
"Create a vertical split
nnoremap \| :vsp<CR>
" Resize window vertically - grow
" nnoremap <Leader>ff 15<c-w>+
" Resize window vertically  - shrink
nnoremap <Leader>ee 15<c-w>-
" Increase window size horizontally
nnoremap <leader>f 15<c-w>>
" Decrease window size horizontally
nnoremap <leader>ff 15<c-w><
" Max out the height of the current split
nnoremap <localleader>f <C-W>_
" Max out the width of the current split
nnoremap <localleader>e <C-W>|


"Normalize all split sizes, which is very handy when resizing terminal
nnoremap <leader>= <C-W>=
"Break out current window into new tabview
nnoremap <leader>t <C-W>T
"Close every window in the current tabview but the current one
nnoremap <localleader>q <C-W>o
"Swap top/bottom or left/right split
nnoremap <leader>r <C-W>R
"--------------------------------------------
nnoremap gn :tabnext<CR>
nnoremap gl :tabprev<CR>

nnoremap <leader>x :lclose<CR>

"Indent a page of HTML (?works for other code)
nnoremap <C-G> gg=G<CR>

"Change operator arguments to a character representing the desired motion
"- there are native text motions with do this - "b i.e cib - change inner block
"Moves to the previous set of parentheses and operate on its contents
" onoremap lp  :<c-u>normal! F)vi(<cr>
"Moves to the next set of parentheses and operate on its contents
" onoremap np :<c-u>normal! f(vi(<cr>
"Moves to the previous set of braces and operate on its contents
" onoremap lb :<c-u>normal! F}vi{<cr>
"Moves to the next set of braces and operate on its contents
" onoremap nb :<c-u>normal! f{vi{<cr>
"Deletes around next pair of parens - still can't crack it
" onoremap op :<c-u>normal! F(vT)<cr>
"Works similarly to the bindings above - finds quotes and operates inside them
" onoremap sq :<c-u>normal! f'vi'<cr>
" onoremap dq :<c-u>normal! f"vi"<cr>

"For each char her it applies a remap deleting all occurrences of the car with
"an a operator or the things past it with an i operator
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '`' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor


"map window keys to leader
noremap <C-h> <c-w>h
noremap <C-j> <c-w>j
noremap <C-k> <c-w>k
noremap <C-l> <c-w>l


"Remap arrow keys to do nothing
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"key mappings 
"Remaps the binding to increment numbers to <leader>a and to decrement to å

nnoremap <silent> <Leader>a <C-A>
nnoremap <silent> å <C-X>


"Moves cursor back to the start of a line
inoremap <C-B> <C-O>I
"Remaps native ctrl h - emulates backspace to ctrl d
inoremap <C-D> <C-H>
"Remaps native ctrl k - deleting to the end of a line to control e
inoremap <C-Q> <C-K>

" Map jk to esc key - using jk prevents jump that using ii causes
inoremap jk <ESC>
nnoremap jk <ESC>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y


"Maps K and J to a 10 k and j but @= makes the motions multipliable - not
"a word I know
noremap K  @='10k'<CR>
noremap J  @='10j'<CR>

"This line opens the vimrc in a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"This line allows the current file to source the vimrc allowing me use bindings as they're added
nnoremap <leader>sv :source $MYVIMRC<cr>
"This maps leader quote (single or double to wrap the word in quotes)
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

nnoremap <leader>< viw<esc>a ><esc>bi<<esc>lel
" Remap going to beginning and end of lines
" move to beginning/end of line
nnoremap B ^
nnoremap E $

"Map Q to remove a CR
nnoremap Q J

"Terminal mappings to allow changing windows with Alt-h,j,k,l
if has("nvim")
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
endif


"Add neovim terminal escape with ESC mapping
if has("nvim")
  :tnoremap <ESC> <C-\><C-n>
endif
"}}}

"===================================================================================
"Mouse
"==================================================================================={{{
set mousehide

set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
"Stop mouse scrolling
if !has('nvim')
  " set  mouse=c
  set mouse=a "this is the command that works for mousepad
  noremap <ScrollWheelUp>      <nop>
  noremap <S-ScrollWheelUp>    <nop>
  noremap <C-ScrollWheelUp>    <nop>
  noremap <ScrollWheelDown>    <nop>
  noremap <S-ScrollWheelDown>  <nop>
  noremap <C-ScrollWheelDown>  <nop>
  noremap <ScrollWheelLeft>    <nop>
  noremap <S-ScrollWheelLeft>  <nop>
  noremap <C-ScrollWheelLeft>  <nop>
  noremap <ScrollWheelRight>   <nop>
  noremap <S-ScrollWheelRight> <nop>
  noremap <C-ScrollWheelRight> <nop>
endif
"}}}
"====================================================================================
"Buffer and Tab settings
"===================================================================================={{{
"Could potentially break everything but should change vim dir to files dir
set autochdir
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set nohidden


" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nnoremap <leader>n :enew<cr>
" Opens a new tab
nnoremap <localleader>n :tabnew<CR>

" Shared bindings from Solution #1 from earlier
nmap <leader>bq :bp <BAR> bd #<cr>

"The line below will re color the line numbers column if you want to
" hi LineNr   cterm=bold ctermbg=gray ctermfg=black gui=bold guibg=gray guifg=white


" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap ,q :bp <BAR> bd #<CR>

" " Show all open buffers and their status
" nmap <leader>bl :ls<CR>

"}}}
" ----------------------------------------------------------------------------
" Message output on vim actions
" ----------------------------------------------------------------------------

set shortmess-=f                      " (file x of x) instead of just (x of x)
set shortmess+=mnrxoOt
if has('patch-7.4.314')
  set shortmess+=c                    " Disable 'Pattern not found' messages
endif

" ----------------------------------------------------------------------------
" Window splitting and buffers
" ----------------------------------------------------------------------------
set splitbelow "Open a horizontal split below current window
set splitright "Open a vertical split to the right of the window
set fillchars=vert:│                  " Vertical sep between windows (unicode)- ⣿
" reveal already opened files from the quickfix window instead of opening new
" buffers
set switchbuf=useopen

" ----------------------------------------------------------------------------
" Diffing
" ----------------------------------------------------------------------------{{{

" Note this is += since fillchars was defined in the window config
set fillchars+=diff:⣿
set diffopt=vertical                  " Use in vertical diff mode
set diffopt+=filler                   " blank lines to keep sides aligned
set diffopt+=iwhite                   " Ignore whitespace changes
"}}}
" ----------------------------------------------------------------------------{{{
"             Format options
" ----------------------------------------------------------------------------
" Input auto-formatting (global defaults)
" Probably need to update these in after/ftplugin too since ftplugins will
" probably update it.
set formatoptions=
set formatoptions+=1
set formatoptions-=q                  " continue comments with gq"
set formatoptions+=c                  " Auto-wrap comments using textwidth
set formatoptions-=r                  " Do not continue comments by default
set formatoptions-=o                  " do not continue comment using o or O
set formatoptions+=n                  " Recognize numbered lists
set formatoptions+=2                  " Use indent from 2nd line of a paragraph

set nrformats-=octal " never use octal when <C-x> or <C-a>"
"}}}
" ----------------------------------------------------------------------------
" Vim Path
" ----------------------------------------------------------------------------
"Vim searches recursively through all directories and subdirectories
set path+=**

" ----------------------------------------------------------------------------
" Wild and file globbing stuff in command mode
" ----------------------------------------------------------------------------{{{
set wildmenu
set wildmode=list:longest,full        " Complete files using a menu AND list
set wildignorecase
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
" set wildignore+=*.*~,*~
set wildignore+=*.swp,.lock,.DS_Store,._*,tags.lock

"}}}
" ----------------------------------------------------------------------------
" Display
" --------------------------------------------------------------------------{{{
set title                             " wintitle = filename - vim
"Using current terminal font - which is a patched nerd font
" set guifont=Inconsolata\ for\ Powerline\ Plus\ Nerd\ File\ Types:14
" augroup MatchParens
"   au!
"   autocmd VimEnter * :DoMatchParen<CR>
" augroup END
highlight MatchParen ctermbg=blue guibg=lightgreen 

"Add relative line numbers and relative = absolute line numbers i.e current
"lines shows absolute and all others are relative
set ttyfast " Improves smoothness of redrawing when there are multiple windows 

set relativenumber
set number


"relative add set relativenumber to show numbers relative to the cursor
set numberwidth=5
"Turns on smart indent which can help indent files like html natively
set smartindent
set wrap
" This should cause lines to wrap around words rather than random characters
set linebreak
set textwidth=79
"Use one space, not two, after punctuation
set nojoinspaces

set autowrite "Automatically :write before running commands

set backspace=2 "Back space deletes like most programs in insert mode
if has('vim')
  set signcolumn=yes "enables column that shows signs and error symbols
endif

set ruler
set incsearch

" Always display the status line even if only one window is displayed
set laststatus=2

" Turns of lazyredraw which postpones redrawing for macros and command
" execution
set nolazyredraw

" Use visual bell when there are errors not audio beep
set visualbell
"Reset color on quitting vim
" au VimLeave * !echo -ne""\033[0m"
"Setting the t_ variables if a further step to ensure 24bit colors
if has('termguicolors')
  " && !has('gui_running')
  set termguicolors
  " set vim-specific sequences for rgb colors
  "super important for truecolor support in vim
  let &t_8f="\<esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<esc>[48;2;%lu;%lu;%lum"
  " set t_8b="^[[48;2;%lu;%lu;%lum"
  " set t_8f="^[[38;2;%lu;%lu;%lum"
endif
"}}}
"================================================================================
"Whitespace
"================================================================================
"Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·,trail:·,nbsp:·


" function! StripWhiteSpace ()
"  exec ':%/ \+$//gc'
" endfunction
" map <leader>r :call StripWhiteSpace ()<CR>


"Courtesy of vim casts - http://vimcasts.org/episodes/show-invisibles/
" set list
" set listchars=
"This sets list tab chars to invisible
" set listchars=tab:\ \
" set listchars+=tab:▸\
" set listchars+=tab:\┆\
" set listchars+=trail:·
" set listchars+=nbsp:⣿
" set listchars+=extends:»              " show cut off when nowrap
" set listchars+=precedes:«
" "Invisible character colors
" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59
"
set omnifunc=syntaxcomplete#Complete
" ------------------------------------
" Command line
" ------------------------------------
"Show commands being input
set showcmd
" Set command line height to two lines
set cmdheight=1

"-----------------------------------------------------------------
"Abbreviations
"-----------------------------------------------------------------
iabbrev w@ www.akin-sowemimo.com

if &statusline ==# ''
    set statusline=
  endif

" Broken down into easily includeable segments
" set statusline=%f
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=%{ObsessionStatus()} "Tpope's sessions management
set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
" set statusline+=%#warningmsg#
"------------------------------------
"  Tab line
"------------------------------------
"Setting show tabline causes tabline to redraw without highlighting
set showtabline=2
"fugitive plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"-----------------------------------------------------------------
"Plugin configurations
"-----------------------------------------------------------------{{{
nnoremap <localleader>h <Esc>:call ToggleHardMode()<CR>
" imap <C-c> <plug>NERDCommenterInsert

let delimitMate_balance_matchpairs = 1
let g:textobj_comment_no_default_key_mappings = 1
xmap ax <Plug>(textobj-comment-a)
omap ax <Plug>(textobj-comment-a)
xmap ix <Plug>(textobj-comment-i)
omap ix <Plug>(textobj-comment-i)

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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


let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
nmap <silent> co <Plug>(jsdoc)
" nmap <silent> co ?function<cr>:noh<cr><Plug>(jsdoc)


let g:vimjs#smartcomplete = 1
" Disabled by default. Enabling this will let vim complete matches at any location
" e.g. typing 'document' will suggest 'document' if enabled.

let g:vimjs#chromeapis = 1
" Disabled by default. Toggling this will enable completion for a number of Chrome's JavaScript extension APIs

set updatetime=250

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('NERDTree')
  if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
  endif
endif



"Rebound git commands to manipulate hunks that are staged to allow comment
"object to work
omap ig <Plug>GitGutterTextObjectInnerPending
omap ag <Plug>GitGutterTextObjectOuterPending
xmap ig <Plug>GitGutterTextObjectInnerVisual
xmap ag <Plug>GitGutterTextObjectOuterVisual

" vim_markdown plugin should clean up after itself
let vim_markdown_preview_temp_file=1
" Use right side of the screen for opening splits
let g:buffergator_viewport_split_policy = 'R'

"This sets default mapping for camel case text object
call camelcasemotion#CreateMotionMappings('<leader>')
" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1
 
" Looper buffers
let g:buffergator_mru_cycle_loop = 1
"Bound to Alt-H,J,K,L to open splits with MRU buffers 
nnoremap ˚ :BuffergatorMruCyclePrev leftabove vert sbuffer<CR>
nnoremap ˙ :BuffergatorMruCyclePrev leftabove sbuffer<CR>
nnoremap ¬ :BuffergatorMruCyclePrev rightbelow vert sbuffer<CR>
nnoremap ∆ :BuffergatorMruCyclePrev rightbelow sbuffer<CR>


" Go to the next buffer open
nmap <leader><tab>  :BuffergatorMruCycleNext<cr>

" Go to the previous buffer open
nmap <leader>/ :BuffergatorMruCyclePrev<cr>


" View the entire list of buffers open
nmap <leader>o :BuffergatorToggle<cr>


" augroup FormatText
"   au!
"   au BufWrite * :Autoformat "sets vim auto format to run on save
" augroup END
noremap <F3> :Autoformat<CR>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.js,*.html,*.xhtml,*.phtml"

"=============================================================
"               Lightline
"=============================================================
" \ 'right': [ [ 'close' ], ],
" use lightline-buffer in lightline
let g:lightline = {
  \ 'colorscheme': 'sialoquent',
  \ 'tabline': {
      \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
      \ },
  \ 'component_expand': {
      \ 'buffercurrent': 'lightline#buffer#buffercurrent2',
      \ },
  \ 'component_type': {
      \ 'buffercurrent': 'tabsel',
      \ },
  \ 'component_function': {
      \ 'bufferbefore': 'lightline#buffer#bufferbefore',
      \ 'bufferafter': 'lightline#buffer#bufferafter',
      \ 'bufferinfo': 'lightline#buffer#bufferinfo',
      \ },
\ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '∿', 'right': '❂' }
  \ }


function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction



" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
" let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_modified_icon = '+'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

"=============================================================
"               Airline
"=============================================================
" let g:airline_extensions = ['branch','tabline','obsession']
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" " let g:airline#extensions#tagbar#enabled = 1
" let g:airline_detect_iminsert                  = 1
" let g:airline_detect_crypt                     = 0 " https://github.com/vim-airline/vim-airline/issues/792
" let g:airline_powerline_fonts                  = 1
" let g:airline#extensions#tabline#enabled       = 1
" " let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
" let g:airline#extensions#tabline#show_tabs     = 1
" let g:airline#extensions#tabline#tab_nr_type   = 2 " Show # of splits and tab #
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#show_tab_type = 1
" " Makes airline tabs rectangular
" let g:airline_left_sep = ' '
" let g:airline_right_sep = ' '
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
"
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = '|'
" "This defines the separators for airline changes them from the default arrows
" let g:airline_left_alt_sep = ''
" let g:airline_right_alt_sep = ''
"
" " configure whether close button should be shown: >
" let g:airline#extensions#tabline#show_close_button = 1
"
" " determine whether inactive windows should have the left section collapsed to
" " only the filename of that buffer.  >
" let g:airline_inactive_collapse=1
" " * configure symbol used to represent close button >
" " let g:airline#extensions#tabline#close_symbol = 'X'
" " * configure pattern to be ignored on BufAdd autocommand >
"   " fixes unnecessary redraw, when e.g. opening Gundo window
" let airline#extensions#tabline#ignore_bufadd_pat =
"       \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
"
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <localleader>1 <Plug>AirlineSelectTab1
" nmap <localleader>2 <Plug>AirlineSelectTab2
" nmap <localleader>3 <Plug>AirlineSelectTab3
" nmap <localleader>4 <Plug>AirlineSelectTab4
" nmap <localleader>5 <Plug>AirlineSelectTab5
" nmap <localleader>6 <Plug>AirlineSelectTab6
" nmap <localleader>7 <Plug>AirlineSelectTab7
" nmap <localleader>8 <Plug>AirlineSelectTab8
" nmap <localleader>9 <Plug>AirlineSelectTab9
" nmap <localleader>- <Plug>AirlineSelectPrevTab
" nmap <localleader>+ <Plug>AirlineSelectNextTab
"
"Remaps native insert mode paste binding to alt-p
inoremap π <C-R>0
inoremap … <C-R><C-P>0
" saves on moving pane but only the currently opened buffer if changed
let g:tmux_navigator_save_on_switch = 1

"-----------------------------------------------------------
"     NEOMAKE 
"-----------------------------------------------------------
augroup Neomake
  au!
autocmd BufWritePost * Neomake
" autocmd! BufWritePost,BufReadPost * Neomake
augroup END
let g:neomake_verbose = 0
let g:neomake_list_height = 6
let g:neomake_open_list = 2
let g:quickfixsigns_protect_sign_rx = '^neomake_'
" let g:neomake_warning_sign = {
"   \ 'text': 'W',
"   \ 'texthl': 'WarningMsg',
"   \ }
" let g:neomake_error_sign = {
"   \ 'text': 'E',
"   \ 'texthl': 'ErrorMsg',
"   \ }
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
    \ 'args': ['-std=c++14', '-Wall', '-Wextra', '-Weverything', '-pedantic']
    \ }


"}}}
"-----------------------------------------------------------
"Colorscheme
"-----------------------------------------------------------
" let g:thematic#themes = {
"       \ 'onedark' : { 'colorscheme':'onedark',
"       \               'background': 'dark',
"       \               'laststatus': 2,
"       \               'airline-theme': 'onedark',
"       \                },
"       \ 'solarized' :{'colorscheme': 'solarized8_dark_high',
"       \                 'background': 'dark',
"       \                 'airline-theme': 'badwolf',
"       \                 'ruler': 1,
"       \                },
" }
"Set color Scheme
if has('nvim')
  colorscheme solarized8_dark_high

  fun! Solarized8Contrast(delta)
  let l:schemes = map(["_low", "_flat", "", "_high"], '"solarized8_".(&background).v:val')
  exe "colors" l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
endf
  let g:solarized_visibility="high"
  let g:solarized_statusline="normal"

nnoremap <F8> :<c-u>call Solarized8Contrast(-v:count1)<cr>
nnoremap <F7> :<c-u>call Solarized8Contrast(+v:count1)<cr>
else
  colorscheme sialoquent
  let g:gitgutter_sign_modified = '•'
  let g:gitgutter_sign_added = '❖'
  highlight GitGutterAdd guifg = '#A3E28B'
endif

"Sets no highlighting for conceal
hi Conceal ctermbg=none ctermfg=none guifg=NONE guibg=NONE
" OneDark =================================================
" colorscheme onedark


"One (Dark) Atom theme =====================================
"The theme below is essentially a variant of the one above, they look identical
  " colorscheme one
  " set background=dark
  " let g:one_allow_italics = 1 " I love italic for comments


"This sets the search highlighting which actually changes the appearance of
"neomake/ any linters warnings
" hi Search term=bold cterm=bold ctermfg=9 ctermbg=0 gui=bold guifg=#cb4b16 guibg=#073642


"Spring Night ===============================================
  " let g:spring_night_high_contrast=[]
  " colorscheme spring-night

"Oceanic Next ===============================================
" The Best and Most stable colorscheme
" colorscheme OceanicNext



" Spring Night ==============================================
" This variable needs to be set, and set to nothing to maintain a light
" contrast
  " let g:spring_night_high_contrast=[]
  " colorscheme spring-night

"=======================================================================
"Airline theme
"=======================================================================
" if !has('gui_running') && !has('nvim')
  " adding to vim-airline's statusline 
  " let g:airline_theme='onedark'
  " let g:airline_theme='solarized'
  " let g:airline_theme='spring_night'
" else
"   let g:airline_theme='solarized'
" endif

" remap arrow keys
nnoremap <Leader><Leader> :bprev<CR>
nnoremap <Leader>. :bnext<CR>

" ----------------------------------------------------------------------------
" Tabbing - overridden by editorconfig, after/ftplugin
" ----------------------------------------------------------------------------{{{
set expandtab                         " default to spaces instead of tabs
set shiftwidth=2                      " softtabs are 2 spaces for expandtab

" Alignment tabs are two spaces, and never tabs. Negative means use same as
" shiftwidth (so the 2 actually doesn't matter).
set softtabstop=-2

" real tabs render width. Applicable to HTML, PHP, anything using real tabs.
" I.e., not applicable to JS.
set tabstop=8

" use multiple of shiftwidth when shifting indent levels.
" this is OFF so block comments don't get fudged when using \">>" and \"<<"
set noshiftround

" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'. 'tabstop' or 'softtabstop' is used in other places.
set smarttab

"Add vim sensible config options

if !has('nvim')
  set complete-=i
  set autoindent
endif

" Use <C-I> to clear the highlighting of :set hlsearch.
" if maparg('<C-I>', 'n') ==# ''
"   nnoremap <silent> <C-I> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-I>
" endif
"
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
scriptencoding utf-8

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif




if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

set autoread " reload files if they were edited elsewhere

if &history < 1000
  set history=1000
endif
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


"Turn swap files off - FOR GOD's SAKE they are ruining my life
set noswapfile
"This saves all back up files in a vim backup directory
set backupdir=~/.vim/.backup//
" set directory=~/.vim/.swp//
set undofile
set undodir=~/.vim/.undo//

if has("vms")
  set nobackup
else
  set backup
endif
set history=50
"}}}
" ----------------------------------------------------------------------------
" Match and search
" ----------------------------------------------------------------------------
" Sets a case insensitive search except when using Caps
set ignorecase
set smartcase
set wrapscan " Searches wrap around the end of the file
set nohlsearch " -functionality i.e. search highlighting done by easy motion

" ---------------------------------------------------------------------
" Cursor
" ---------------------------------------------------------------------{{{

" Set cursorline to the focused window only and change and previously color/styling of cursor line depending on mode
" augroup highlight_follows_focus
"   autocmd!
"   autocmd WinEnter * set cursorline ctermbg=238
"   autocmd WinLeave * set nocursorline
" augroup END
"
" augroup highlight_follows_vim
"   autocmd!
"   autocmd FocusGained * set hi cursorline ctermbg=238
"   autocmd FocusLost * set nocursorline
" augroup END
" Show context around current cursor position
"As this is set to a large number the cursor will remain in the middle of the
"page on scroll (8 ) was the previous value
set scrolloff=20
set sidescrolloff=16

" Stops some cursor movements from jumping to the start of a line
set nostartofline
"}}}
