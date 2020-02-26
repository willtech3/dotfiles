set nocompatible             " must do this for vundle

" Set vars
syntax enable                " enable syntax processing
set mouse=a                  " enable the mouse
set ttyfast
set hidden
set tabstop=4                  " number of visual spaces per TAB
set softtabstop=4              " number of spaces in tab when editing
set expandtab                  " insert 4 spaces when <TAB> is used in insert mode
set number                     " show line numbers
set showcmd                    " show command in bottom bar
set cursorline                 " highlight the line that the cursor is currently on
set wildmenu                   " show a menu that lists files when using :e
set lazyredraw                 " redraw only when we need to
set showmatch                  " highlight matching [{()}]
set incsearch                  " search as characters are entered
set hlsearch                   " highlight search results
set foldenable                 " enable folding
set foldlevelstart=10          " open most folds by default
set foldnestmax=10             " 10 nested folds max
set foldmethod=indent          " fold based on indent level
set background=dark            " set background to dark to fix colors
set noswapfile                 " remove .swp files
set t_Co=256                   " set colors to 256
set backspace=indent,eol,start " allow backspacing over indent, eol and starts

" Backup settings
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

let mapleader=","            " leader is comma

" jj is escape
inoremap jj <esc>

" clear the search highlight
nnoremap <leader><space> :nohlsearch<CR>

" space opens/closes folds
nnoremap <space> za

" move vertically by visual line and skip over wrapped lines
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'              " adds git functionality with :G commands
Plugin 'tpope/vim-rhubarb'               " adds github functionality also with :G commands
Plugin 'tpope/vim-rails.git'             " adds a ton of rails functionality
Plugin 'tpope/vim-markdown'              " this one may not be needed
Plugin 'tpope/vim-surround'              " make changing surrounding chars easier
Plugin 'sjl/badwolf'                     " a bold theme
Plugin 'mbbill/undotree'                 " displays the undo tree in a graphical manner
Plugin 'jtratner/vim-flavored-markdown'  " extends vim-markdown
Plugin 'jpo/vim-railscasts-theme'        " adds a nice colorscheme for rails development
"Plugin 'rafi/awesome-vim-colorschemes'   " themepack
"Plugin 'rainglow/vim'                    " themepack
Plugin 'othree/html5.vim'                " support for html5 syntax
Plugin 'vim-scripts/lid.vim'             " support for id utils
Plugin 'vim-scripts/svg.vim'             " support for svg files
Plugin 'scrooloose/nerdtree'             " a great vim file browser
Plugin 'scrooloose/nerdcommenter'        " wrangle comments quickly
Plugin 'tyok/ack.vim'                    " enables nerdtree-ack
Plugin 'tyok/nerdtree-ack'               " plugin for searching through dirs
Plugin 'ivalkeen/nerdtree-execute'       " executes files in NerdTree but needs config work
Plugin 'bling/vim-airline'               " sweet status bar at the bottom
Plugin 'chr4/nginx.vim'                  " syntax highlighting for nginx configuration files
Plugin 'airblade/vim-gitgutter'          " visual git modifications in a gutter
Plugin 'godlygeek/tabular'               " make lining code up easier
Plugin 'pangloss/vim-javascript'         " syntax highlighting and improved indentation
Plugin 'ekalinin/Dockerfile.vim'         " syntax highlighting for Dockerfiles
Plugin 'pearofducks/ansible-vim'         " syntax highlighting for ansible
Plugin 'vim-scripts/groovy.vim'          " syntax highlighting for groovy (e.g. Jenkins)
Plugin 'vim-scripts/groovyindent-unix'   " indentation file for groovy
Plugin 'majutsushi/tagbar'               " tag bar for visual file structure <F8>
Plugin 'posva/vim-vue'                   " syntax highlighting for vue.js
Plugin 'cespare/vim-toml'                " syntax highlighing for toml files
Plugin 'python/black'                    " python code formatter
Plugin 'vito-c/jq.vim'                   " syntax highlighting for jq files
Plugin 'awk.vim'                         " indenting for awk scripts
Plugin 'sjbach/lusty'                    " HEAD of the dev repo for lusty juggler and explorer
Plugin 'L9'                              " a library of utility function (not sure if needed)
Plugin 'wincent/Command-T'               " fast fuzzy finder for files
" Plugin 'easymotion/vim-easymotion'       " make searching a little easier
Plugin 'bronson/vim-trailing-whitespace' " :FixWhitespace function

call vundle#end()                        " required for vundle
filetype plugin indent on                " load filetype-specific indent files, required for vundle

" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
nnoremap <leader>s :mksession<CR>

" Open NERDtree in current file
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '.DS_Store', '__pycache__','.*\.egg-info$[[dir]]', '\.pytest_cache[[dir]]', '\.git[[dir]]']


" Set up vim-rhubarb to work with enterprise github urls (for fugitive :Gbrowse)
let g:github_enterprise_urls = ['https://github.umn.edu']

colorscheme railscasts

" Open NerdTree Tabs on startup
" autocmd VimEnter * NERDTree

" Fuguitive shorcuts
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>

"Git Gutter Settings
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
map <leader>gg :GitGutterToggle<CR>

" Map Controls to change windows
nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>

" Change cursor to a line on insert
"let &t_SI = /"\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"let &t_EI = /"\<Esc>]50;CursorShape=0\x7" " Block in normal mode
let &t_SI = "\e[6 q" " Vertical bar in insert mode
let &t_EI = "\e[2 q" " Block in normal mode

" Lusty Juggler settings
map <leader>j :LustyJuggler<CR>
let g:LustyJugglerShowKeys = 'a'

map <leader>f :FixWhitespace<CR>

" Screen/tmux can also handle xterm mousiness, but Vim doesn't
" detect it by default.
if &term == "screen"
     set ttymouse=xterm2
endif

if v:version >= 704 && &term =~ "^screen"
  " Odds are good that this is a modern tmux, so let's pick the
  " best mouse-handling mode.
  set ttymouse=sgr
endif

" Set command t ignore
set wildignore+=**/.git/*,**/doc/yard/*

" Command T show by most recently used
nnoremap <silent> <leader>b :CommandTMRU<CR>


" Set file types for syntax highlighting on open and read
augroup ftgroup
    autocmd!
    au BufNewFile,BufRead *.erb set filetype=eruby.html272
    au BufNewFile,BufRead *.god set filetype=ruby273
    au BufNewFile,BufRead *.js.erb set filetype=eruby.javascript274
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown275
    au BufNewFile,BufRead *.json.erb set filetype=eruby.javascript276
    au BufNewFile,BufRead Jenkinsfile set filetype=groovy277
    " Handlebars
    au  BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vi    m ftplugin/mustache*.vim ftplugin/mustache/*.vim279
    au  BufNewFile,BufRead *.handlebars,*.hbs set filetype=html.handlebars syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/    mustache*.vim ftplugin/mustache/*.vim
    au BufRead /tmp/psql.edit.* set syntax=sql
    autocmd Filetype ruby,javascript,java,yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype scss,css,html,eruby.html,vue setlocal iskeyword+=-
    autocmd Filetype scss,css,html,eruby.html,vue setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType awk nnoremap <leader>a :!awk -f progfile.awk emp.data<CR>
    autocmd FileType c,cpp set autoindent | set cindent
augroup END


