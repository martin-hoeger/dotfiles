filetype off
filetype plugin indent on
 
let mapleader=","
let g:mapleader = ","

colorscheme default
syntax on
syntax sync minlines=200

"#################################################################################
"#################################################################################

set nocompatible
set modeline
set modelines=5
set hidden " Allows vim not tu save buffers, etc...
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
set fileencodings=utf-8,cp1250
set lazyredraw
"set synmaxcol=128
set ttyscroll=3
set ttyfast                   " we have a fast terminal
" set clipboard=unnamed 
set clipboard=unnamedplus 
" Didn't work for me, didn't copy between vims and crtl+c a p
" if has('unnamedplus')
      " set clipboard=unnamed,unnamedplus
" endif
"set iskeyword=@,48-57,192-255
set iskeyword=@,48-57,_,192-255
set tabpagemax=150
" set grepprg=ack
set grepprg=ag\ --nogroup\ --nocolor

"Turn on the Wigtd menu (not give everything in autocomplete)
set wildmenu                    " show list instead of just completing
set wildmode=full
set wildignore=*.swp,*.bak,*.pyc,*.jpg,*.png,*.xcf,*.ttf,*.svg,*.gif
set wildignorecase

"Vim settings
set autoread " Set to auto read when a file is changed from the outside
set ruler
set backspace=start,indent,eol
set whichwrap=b,s,<,>,[,]   " backspace and cursor keys wrap to
set mouse=v
"Numbers on the left side, color: gray
set number
set relativenumber

set hlsearch
set nowrap
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set incsearch " Makes search act like search in modern browsers
set magic " For regular expressions turn magic on
set gdefault                    " the /g flag on :s substitutions by default
set showcmd " This shows what you are typing as a command.  I love this!
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " how many tenths of a second to blink when matching brackets
set nofoldenable              " start files with folds
let g:DisableAutoPHPFolding = 1
set virtualedit=onemore         " allow for cursor beyond last character
set spell                       " spell checking on
set spellfile=~/.vim/spell/dict.add
set spelllang=en_us
set mousemodel=popup
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set cmdheight=1               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set updatetime=200           
set history=10000
set noswapfile
set noerrorbells              " No error bells please
set shell=bash
"set shellcmdflag=-ci
"set cursorline                
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
"set fillchars=diff:⣿,vert:│
"set splitbelow
"set splitright

" Autocomplete
" http://vimdoc.sourceforge.net/htmldoc/options.html#'complete'
" set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set complete=.,w,b,t
set completeopt=longest,menuone

"Time out on key codes but not mappings.
"Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

"Nastavení tabů
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set smarttab
set shiftround

"Backup
set backup
set dir=~/.vim_backup,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim_backup
silent! set undodir=~/.vim_backup
silent! set undofile
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
"Status line gnarliness
set laststatus=2

"#################################################################################
"#################################################################################
"http://vimdoc.sourceforge.net/htmldoc/intro.html#keycodes


"I want to swap some keys to deal with my CZ layout
"noremap z y
"noremap y z

" "Mappuju některé české zmanky, tak abych si ušetřil práci.
" noremap ě @
" noremap ěě @@
" noremap š #
" noremap č $
" noremap ř %
" noremap ž ^
" noremap ý &
" noremap á *
" noremap í {
" noremap é }
" noremap ú (
" "Visal mode
" vnoremap ě @
" vnoremap ěě @@
" vnoremap š #
" vnoremap č $
" vnoremap ř %
" vnoremap ž ^
" vnoremap ý &
" vnoremap á *
" vnoremap í {
" vnoremap é }
" vnoremap ú (

"Quits insert mode
imap jj <Esc>
imap jk <Esc>

"Opens command window
"nnoremap : q:i
"nnoremap / q/i
"nnoremap ? q?i

"Regexpr as PHP
"nnoremap / /\v
"cnoremap %s/ %s/\v

"Nahoru a dolu jde po radcich na obrazovce (funguje i pri text wrap)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

"Remap the 0 (zero) key to put you to the first character of a line, ignoring preceding whitespace.
nmap 0 ^

"Don't move on *
nnoremap * *<c-o>

"Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

"Arrows substitution
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-j> <down>
cnoremap <c-k> <up>

"Insert fullpath of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%%') : '%%'
"Insert the directory of the current buffer in command line mode
"cnoremap <expr> %%d getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"Same when jumping around
map <C-j> g;
map <C-k> g,

"Reindent block
"Adds mark and return back on the mark
nnoremap <Space>= mr=iB`r

"Folding
nnoremap <Tab><Tab> zazz
nnoremap <Tab>j zMzjzvzz
nnoremap <Tab>k zMzkzv[zzz

"Hardtime - do not user hjkl 

"Save
map <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>
vmap <C-S> <Esc>:w<CR>
map <Space>s :w<CR>
"Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

"Open a file in new tab
nnoremap gf <C-W>gf
" Substitute
nmap gs :s///<left>
nmap gS :%s///<left>
vmap gs :s///<left>

"Quit
map <Space>q <Esc>:q<CR>
cmap <Space>q <Esc>:q<CR>

"While search with vimgrep go next a prev item
nnoremap <Tab>n :cn<CR>zRzz
nnoremap <Tab>p :cN<CR>zRzz
nnoremap <Tab>P :cfirst<CR>zRzz
nnoremap <Tab>N :clast<CR>zRzz
"Map cursor keys
" nmap <up> :cN<CR>zRzz
" nmap <down> :cn<CR>zRzz
" nmap <S-up> :cfirst<CR>zRzz
" nmap <S-down> :clast<CR>zRzz

"Ctrl+down runs last macro saves and next
nmap <C-down> @@:w<CR>:cn<CR>zRzz
"Undo last change
nmap <C-up> :cN<CR>zRzzu:w<CR>

"Close tab
nnoremap <Tab>q <Esc>:tabclose<CR>:tabprev<CR>

"Windows
"map <C-j> <C-W>j<C-W>_
"map <C-k> <C-W>k<C-W>_
"map <C-h> <C-W>h<C-W>_
"map <C-l> <C-W>l<C-W>_
nnoremap <C-W>v <C-W>v<C-W><C-W>
nnoremap <C-W>s <C-W>s<C-W><C-W>

"Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV
nmap Vj V<Space>j
nmap Vk V<Space>k
nmap <c-v>j <c-v><Space>j
nmap <c-v>k <c-v><Space>k

"Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_

"Visual search
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

"Search for first variable above cursor and copy it to current location
function! PhpVarSearch()
    norm mp
    exe "?\\$[^ )]\\+"
    norm "lyy
    let @l = substitute(@l, '^[^\$]*\(\$[^ )=]\+\).*', '\1', '')
    norm f$yW`p"lPl
endfunction
imap §v <C-o>:call PhpVarSearch()<CR>

"Ighlighting gets annoying, set a key to switch it off temporarily
nmap <silent> <leader>n :silent nohlsearch<CR>

"Redraw the screen
nnoremap <leader>r :syntax sync fromstart<cr>:redraw!<cr>

"Tabs
"Moving between tabs
nnoremap <Space>l :tabnext<CR>
nnoremap <Space>h :tabprev<CR>
nnoremap <Space>tj :tabfirst<CR>
nnoremap <Space>tk :tablast<CR>
nnoremap <Space>to :tabonly<cr>
nnoremap <Space>tc :tabclose<cr>
nnoremap <Space>tn :tabnew<CR>
"Duplicate tab
nnoremap <Space>tt :tab split<CR>
"nnoremap tn :tabnew \| FufFile **/<CR>
nnoremap <Space>th :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <Space>tl :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

"Map tab to number
nnoremap <Space>+ 1gt
nnoremap <Space>ě 2gt
nnoremap <Space>š 3gt
nnoremap <Space>č 4gt
nnoremap <Space>ř 5gt
nnoremap <Space>ž 6gt
nnoremap <Space>ý 7gt
nnoremap <Space>á 8gt
nnoremap <Space>í 9gt
nnoremap <Space>é 10gt

"Indent
vnoremap < <gv
vnoremap > >gv
noremap <c-l>  ma>>`a4l
noremap <c-h>  mb<<`b4h
vmap <c-l>  >
vmap <c-h>  <
inoremap <c-l> <c-d>
inoremap <c-h> <c-t>

" "Delete to blakhole
nmap <Space>d "_d
nmap <Space>D "_D
nmap <Space>x "_x
nmap <Space>X "_X

"Do not yank when useing c
nnoremap c "_c

" "It is not needed since we use yankring.
" "If there are olny white chars on the line, delete it in to the blackhole
nnoremap <expr> dd ( !empty(matchstr(getline('.'), '\S')) ? "dd" : '"_dd' )
" "More intuaitive yank
map Y y$
    
"Quickly edit the vimrc file
nmap <Space>vv :tabnew<CR>:lcd ~/.vim<CR>:e ~/.vimrc<CR>
"My cheatsheet
nmap <Space>vc :tabe ~/vim.txt<CR>
nnoremap <Space><Tab> :bn<CR>
"nnoremap <Space><Tab> :ls<CR>:b<Space>

"Go to mark
nnoremap <Space>m `

"Selecting your pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
"Indent pasted text
nnoremap <Leader>p p`[v`]=
nnoremap <Leader>P P`[v`]=

" CtrlP
nnoremap <Space>f :Ex<CR>

let g:ctrlp_working_path_mode = ''
" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

"Vytoří novou řádku a vrátí se do normálního modu
nmap <Space>o o<Esc>k
nmap <Space>O O<Esc>j
nmap <Space>n :Ex<CR>

"shortcut to toggle spelling
"setup a custom dict for spelling
"zg = add word to dict
"zw = mark word as not spelled correctly (remove)
nmap <leader>s :setlocal spell!<CR>

"Execute last command (jako F2)
map ěě :<C-P><CR>
map ě<CR> :!

"Zozrazení obsahu registrů (jako F3)
map šw :set wrap!<CR>
map šr :set relativenumber!<CR>
map šn :set number!<CR>:set relativenumber!<CR>
map šg :e!<CR>G

"Exit vim
"map <Space><F4> :call g:SessionExecute("SaveSession")<CR>:qa<CR>
map <Space>č :qa<CR>
"Paste toggle
map č :set paste!<CR>

"Run the current file
map řs :!%:p<CR>
"Run current file in the background
map řb :Shell! %:p<CR>
"Execute current line in bash
map řl :exec '!'.getline('.')<CR>
"Execute the whole contant of the script
" map řa :exec '!'.getline('.')<CR>

"Reloads file
map řr :e!<CR>

"Ctrl-K Konec - skočí na konec řádku
imap <C-k> <C-g>g
  
"#################################################################################
"#################################################################################

"Autocomands need to by loaded only once.
augroup vimrc_all
    au!

    "Some extension are not so common
    au BufNewFile,BufRead *.phtml set filetype=phtml.html.php
    au BufNewFile,BufRead *.tpl.php set filetype=phtml.html.php
    au BufNewFile,BufRead *.module set filetype=php
    au BufNewFile,BufRead *.inc set filetype=php
    au BufNewFile,BufRead *.js set filetype=javascript.javascript-jquery
    " Ember
    au BufNewFile,BufRead */app/*.js setlocal shiftwidth=2 | setlocal softtabstop=2
    au BufNewFile,BufRead */tests/*.js setlocal shiftwidth=2 | setlocal softtabstop=2
    au BufNewFile,BufRead *.less setlocal shiftwidth=2
    au BufNewFile,BufRead *.hbs setlocal shiftwidth=2
        \| setlocal softtabstop=2
        \| setlocal commentstring={{!--%s--}}
    "Jquery syntax highlitings
    au BufNewFile,BufRead jquery.*.js set syntax=jquery
    "Automaticaly reload css if file changed
    au BufNewFile,BufRead *.css silent WatchForChanges 
    "Go
    au BufRead,BufNewFile *.go set filetype=go noet ts=4 sw=4 sts=4
        \| map <buffer> <F5>s :w<CR>:GoRun %%<CR>
        \| map <buffer> <F5>t :w<CR>:GoTest<CR>
    " Nginx config
    au BufNewFile,BufRead /etc/nginx/* set ft=nginx

    "Text files
    "Adding list bullets automatically:
    "http://stackoverflow.com/questions/9065967/markdown-lists-in-vim-automatically-new-bullet-on-cr
    au BufNewFile,BufRead *.txt set ft=markdown
        \| setlocal wrap
        \| setlocal linebreak
        \| setlocal com=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:-
        \| setlocal formatoptions=tcroqln

    au BufNewFile,BufRead *.apib setlocal wrap
        \| setlocal linebreak

    " Yaml support
    au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    autocmd FileType yaml nmap <buffer> řs :!kubectl apply -f %:p<CR>


    "Autoload .vimrc
    au BufWritePost .vimrc source %
    
    "Autoload new snippets when snippets file is saved.
    " au BufWritePost *.snippets :NeoSnippetSource %

    "Better autocomplete
    "Enable omni completion. Not required if they are already set elsewhere in .vimrc
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
                \| setlocal foldmethod=expr 
                \| setlocal foldexpr=(getline(v:lnum)!~'^/\\*\\*')?1:'>1' 
                \| setlocal foldtext=MyFoldText()
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    "Correct comments for php.
    "PHP didn't want to extend comments on new lines.
    " au FileType php setlocal comments=s1:/*,mb:*,ex:*/,://,:#
    " au FileType php setlocal formatoptions+=cro

    " Tex markdown syntax
    au BufEnter *.tex highlight TexHeadline1 cterm=bold ctermfg=112 ctermbg=black
    au BufEnter *.tex highlight TexHeadline2 cterm=bold ctermfg=115 ctermbg=black
    au BufEnter *.tex highlight TexHeadline3 cterm=bold ctermfg=130 ctermbg=black
    au BufEnter *.tex syntax match TexHeadline1 /^\s*#\s\+.*$/
    au BufEnter *.tex syntax match TexHeadline2 /^\s*##\s\+.*$/
    au BufEnter *.tex syntax match TexHeadline3 /^\s*###\s\+.*$/

    "Hightlite active window
    " au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    " au WinLeave * setlocal nocursorline
            
    "Save on losing focus
    " au FocusLost * :wa

    "Opens vim on the last location where the file was closed
    au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     execute 'normal! g`"zvzz' |
            \ endif

    "Command window
    au CmdwinEnter * setlocal nonumber
    "au CmdwinEnter * setlocal nonumber | map <buffer> <F5> <CR>q:

    " Browserlink: Reload page when editing phtml or module file
    " au BufWritePost *.phtml,*.module :BLReloadPage
    " au BufWritePost *.css :BLReloadCSS	
    
    "Quickfix window to open after any grep invocation
    autocmd QuickFixCmdPost *grep* cwindow

augroup END



"#################################################################################
"#################################################################################

"Colors

" Color codes
" http://guns.github.io/xterm-color-table.vim/images/xterm-color-table-with-visible-rgb.png

hi Pmenu ctermfg=black ctermbg=white
hi PmenuSel ctermfg=black ctermbg=red
hi Search ctermfg=black ctermbg=11
hi MatchParen cterm=bold ctermfg=cyan ctermbg=black
hi CursorLine cterm=none ctermbg=235
hi Visual cterm=none ctermfg=black ctermbg=208
hi LineNr cterm=none ctermfg=236 ctermbg=none
hi Folded cterm=none ctermfg=white ctermbg=232
hi phpTodo cterm=bold ctermfg=black ctermbg=red
"Spelling
hi clear SpellBad
hi SpellBad ctermfg=black ctermbg=none ctermfg=162
"Marks on the left side
hi SignColumn ctermfg=red ctermbg=none cterm=bold 
" Git diff
hi DiffAdd      cterm=bold ctermbg=14 guibg=LightBlue
hi DiffChange   cterm=bold ctermbg=14 guibg=LightMagenta
hi DiffDelete   cterm=bold ctermfg=12 ctermbg=159 gui=bold guifg=Blue guibg=LightCyan
hi DiffText     cterm=reverse cterm=bold ctermbg=9 gui=bold guibg=Red

" Fix of error
hi CtrlPlight_to_CtrlPdark_inactive ctermfg=black ctermbg=white
hi CtrlPdark_to_CtrlPlight_inactive ctermfg=black ctermbg=white
hi CtrlPwhite_to_CtrlPlight_inactive ctermfg=black ctermbg=white
hi CtrlPlight_to_CtrlPwhite_inactive ctermfg=black ctermbg=white
hi CtrlPdark_to_CtrlPdark_inactive ctermfg=black ctermbg=white

" Markdown
hi markdownH1 ctermfg=red ctermbg=black
hi markdownH2 ctermfg=green ctermbg=black



"#################################################################################
"#################################################################################

"Local config
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
