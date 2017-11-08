"
" Read over this entire file carefully!
"
set nocompatible    " be improved vi!
set showcmd         " show commands in bottom right-hand corner
set laststatus=2    " always show the status line
set ruler           " line and col # of cursor
set nonu            " line numbers off (use :<number> to jump to lines!)
set nowrap          " line wrapping off
set fo-=t           " don't auto-wrap when typing
set timeoutlen=250  " time to wait after ESC (default causes an annoying delay)
set noerrorbells    " no noise
set wildmenu        " enhanced command-line 'wildchar' (e.g. <Tab>) completion

" GUI-specific
if has("gui_running")
  set guioptions-=m   " remove menu bar
  set guioptions-=T   " remove toolbar
  set guioptions+=a   " yank to system clipboard
  colorscheme railscasts
  " GVim
  if has("gui_gtk2")
    set lines=999 columns=999 " maximize gvim window.
    set guifont=Monaco\ 9.1
  " OSX, Windows
  elseif has("gui_win32") || has("gui_macvim")
    set guifont=Monaco:h9.1 " (untested)
  endif
else
  " TODO alternative: use 'godlygeek/csapprox' plugin, or for 256-color terms
  "  there is also a 256-color railscasts theme out there.
  colorscheme default
endif

" Searching
set incsearch   " show matches as search is typed
set hlsearch    " highight matches (see Key mappings below for hiding highlight)

" Folding
" NOTE: look in syntax.txt help file for language-specific folding
"         (e.g. :let ruby_fold = 1)
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " dont fold by default
set foldlevel=1       " this is just what i use

" Formatting, Movement
set expandtab                   " insert spaces instead of tabs
set tabstop=4                   " tabs are 4 spaces
set softtabstop=4
set shiftwidth=4                " tabs under smart indent
set autoindent                  " copy current line indent to next line
set backspace=start,indent,eol  " what we can backspace over
set virtualedit=block           " see :h virtualedit

" turn on syntax highlighting
let java_highlight_java_lang_ids=1
syntax enable

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" TODO: Had to add these two lines b/c otherwise highlighting did not work
"  when entering file types defined in ftdetect (at least python, ruby). Why?
autocmd BufWinEnter * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertLeave * highlight ExtraWhitespace ctermbg=red guibg=red

" uncomment to open QuickFix window after :grep
"autocmd QuickFixCmdPost *grep* cwindow

" Key mappings
"
" WARNING! too many core functionality mappings will cause config reliance
"
" exit insert mode with 'k' and 'd' pressed simultaneously
imap kd <Esc>
imap dk <Esc>
" auto-complete word with 'f' and 'j' pressed simultaneously
imap fj <C-n>
imap jf <C-n>
" clear the search register with '.' and '/' pressed simultaneously
" (also clears highlight, normally done with :noh)
nmap <silent> ./ :let@/=""<CR>
nmap <silent> /. :let@/=""<CR>
" quickfix next, prev
" (e.g. :vimgrep for something, then navigate through results with next/prev)
map <C-p> :cp<CR>
map <C-n> :cn<CR>
" save the current session to a default location:
map <C-s> :mksession! ~/.vimsessions/session.vim<CR>
" comma is <Leader>
let mapleader = ','
" write file quicker!
map <Leader>w :w<Esc>
" faster folding
nnoremap <space> za
vnoremap <space> zf
nnoremap <S-space> zO

" NeoBundle for plug-in management
"
" (see https://github.com/shougo/neobundle.vim)
"
" Brief help
"  :NeoBundleList          - list configured bundles
"  :NeoBundleInstall(!)    - install(update) bundles
"  :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" See :h neobundle for more details

if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath^=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle Bundles
" NOTE: comments after Bundle commands are not allowed
"
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

"" Command-T plug-in: fuzzy-find and open files *very* quickly
NeoBundle 'Command-T'
"" Highlight python errors (syntax, import, etc.)
NeoBundle 'kevinw/pyflakes-vim'
"" NERD Tree file explorer
NeoBundle 'scrooloose/nerdtree'
"" Really awesome git wrapper
NeoBundle 'tpope/vim-fugitive'
"" Manipulate 'surroundings': parentheses, brackets, quotes, HTML tags, and more
NeoBundle 'tpope/vim-surround'
"" Allows using '.' to repeat plugin maps, not just built-in commands
NeoBundle 'tpope/vim-repeat'
"" Requirements for vim-snipmate (see below)
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
"" Support for Textmate-style snippits, and a library of snippits
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
"" Puppet syntax, snippits for snipmate, etc.
NeoBundle 'rodjek/vim-puppet'
"" Advanced matching for %
NeoBundle 'matchit.zip'
"" Scala language
NeoBundle 'derekwyatt/vim-scala'
"" Golang
NeoBundle 'fatih/vim-go'
"" Javascript
NeoBundle 'pangloss/vim-javascript'

call neobundle#end()

" NOTE! This must be set after Vundle Bundles declared
" Attempt to determine the type of a file based on its name and possibly its
" contents, to allow intelligent auto-indenting for each filetype, and for
" plugins that are filetype specific.
filetype indent plugin on

"
" Plug-in settings and key mappings
"

map <Leader>t :execute 'NERDTreeToggle' . getcwd()<Esc>
map <Leader>T :execute 'NERDTree'<Esc>
map <Leader>f :CommandT<Esc>

" Command-T
let g:CommandTMaxFiles=100000

" pyflakes
let g:pyflakes_use_quickfix=0

" vim-go
" any gofmt-on-save errors cause quickfix to pop up -- annoying
let g:go_fmt_fail_silently = 0
