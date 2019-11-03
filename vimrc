"
"       _
"__   _(_)_ __ ___  _ __ ___
			"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__
"  \_/ |_|_| |_| |_|_|  \___|

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let mapleader=" "

let &t_ut=''
set nocompatible

"chang dir
set autochdir

"cp the text in the system clipboard
set clipboard=unnamedplus
syntax on
syntax enable

filetype off
filetype indent on
filetype plugin on
filetype plugin indent on

"some path config
set path+=**
set signcolumn=yes
set mouse=a
set encoding=utf-8
set ruler
set number
set relativenumber

set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildmode=longest,full

set wrap
set cursorline
set showcmd

"hlsearch
set hlsearch
set incsearch

"upper and lower cases
set ignorecase
set smartcase

set scrolloff=6
set termguicolors

" when you first go into vim it will not show the preview hlsearch which is the system default
exec "nohlsearch"
"exec "AirlineToggleWhitespace"

" some changes on noremap
noremap H 5h
noremap L 5l
noremap J 5j
noremap K 5k
noremap W 5w
noremap B 5b



" map some keys
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>


map <LEADER>rc :e ~/.vim/vimrc<CR>
map <LEADER>w <C-w>w
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

"move between buffer file
map <LEADER>n :bn<CR>
map <LEADER>p :bp<CR>

" Place the two screens up and down
noremap <LEADER>v <C-w>t<C-w>K

" Place the two screens side by side
noremap <LEADER>b <C-w>t<C-w>H

"creat new tabes and change between them
map tn :tabe<space>
map th :-tabnext<CR>
map tl :+tabnext<CR>

"searching config
map <LEADER><CR> :nohlsearch<CR>

"art letter
map to :r !toilet
map fi :r !figlet

"resize the window in the way you'd like to do
"
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"table mode
map <LEADER>tm :TableModeToggle<CR>

"ternimal window location
noremap <LEADER>/ :set splitbelow<CR>:term<CR>


"select all
nnoremap <LEADER>a ggVG


"       _             _
" _ __ | |_   _  __ _(_)_ __  ___
"| '_ \| | | | |/ _` | | '_ \/ __|
"| |_) | | |_| | (_| | | | | \__ \
"| .__/|_|\__,_|\__, |_|_| |_|___/
"|_|            |___/

"vim plugns (plus: something is really useful
call plug#begin('~/.vim/plugged')

"surroud
Plug 'tpope/vim-surround'

"fancy startup menu
Plug 'mhinz/vim-startify'

"snippets and ulitspis
Plug 'honza/vim-snippets'

"coc again
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"indent
Plug 'Yggdroot/indentLine'

"autoformat
Plug 'Chiel92/vim-autoformat'

"airline and vim syntax
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-bufferline'

"nerttree"
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" distraction free writing mode
Plug 'junegunn/goyo.vim'

"error checking
Plug 'w0rp/ale'

"coding theme for different coding langues
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

"python indent
Plug 'vim-scripts/indentpython.vim'

"MarkDownpreview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

"dependences
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'fadein/vim-FIGlet'
Plug 'kana/vim-textobj-user'

"autopairs
Plug 'jiangmiao/auto-pairs'

"vim-git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"devicons
Plug 'ryanoasis/vim-devicons'

"quick comments
Plug 'scrooloose/nerdcommenter'

"the undotree(just in case)
Plug 'mbbill/undotree'

"ranger
Plug 'francoiscabrol/ranger.vim'

"fzf filefinder
Plug 'junegunn/fzf'

"minimap
Plug 'severin-lemaignan/vim-minimap'

call plug#end()

"update the all the plug packages
function! OnVimEnter() abort
	" Run PlugUpdate every week automatically when entering Vim.
	if exists('g:plug_home')
		let l:filename = printf('%s/.vim_plug_update', g:plug_home)
		if filereadable(l:filename) == 0
			call writefile([], l:filename)
		endif

		let l:this_week = strftime('%Y_%V')
		let l:contents = readfile(l:filename)
		if index(l:contents, l:this_week) < 0
			call execute('PlugUpdate')
			call writefile([l:this_week], l:filename, 'a')
		endif
	endif
endfunction

autocmd VimEnter * call OnVimEnter()

"coc config
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set updatetime=1000

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"indent
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"ale
nmap <silent> <C-i> <Plug>(ale_previous_wrap)
nmap <silent> <C-k> <Plug>(ale_next_wrap)
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_close_preview_on_insert = 1

let g:ale_fix_on_save = 0
let b:ale_fix_on_save = 0
let g:ale_linters = {'python':['pyflakes']}


" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1 

let g:ale_cursor_detail = 0
let b:ale_open_list = 0
let g:ale_list_window_size = 5

augroup CloseLoclistWindowGroup
	autocmd!
	autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END


"Undo Tree
nnoremap <F5> :UndotreeToggle<cr>


"CtrlP (not using it for now)
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mod = 'ra'
"let g:ctrlp_show_hidden = 1
"nmap <C-p> :CtrlP<CR>
"let g:webdevicons_enable_ctrlp = 1

"using FZF now
nmap <C-p> :FZF<CR>


"gitgutter  mappings
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

"Goyo
map go :Goyo<CR> <NL> :set number<CR> <NL> :set relativenumber<CR>

"markdown preview
let g:mkdp_open_to_the_world = 1
map <LEADER>m :MarkdownPreview<CR>
map <LEADER>s :MarkdownPreviewStop<CR>
map <LEADER>t :MarkdownPreviewToggle<CR>

"nerttree
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit="v"
let NERDTreeMapOpenVSplit="h"

"godo some buffers
nnoremap gb :buffers<CR>:buffer<Space>
nnoremap db :buffers<CR>:bd<Space>

"colorscheme
"let g:SnazzyTransparent = 1
"colorscheme  snazzy
let ayucolor = "mirage"
colorscheme ayu

"airline_theme
let g:airline_theme = 'onedark'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#use_vcscommand = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_section_c = '%t'
let g:airline#extensions#whitespace#enabled = 0

				
" keep your cursor position everytime you load in. Just in the preview position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"call CompileRunGcc
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time -p ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time -p ./%<"
	elseif &filetype == 'java'
		exec "!clear"
		exec "!javac %"
		exec "!java %<"
		exec "!clear"
	elseif &filetype == 'sh'
		exec "!time -p bash %"
	elseif &filetype == 'python'
		silent! exec "!clear"
		exec "!time -p python3 %"
	elseif &filetype == 'html'
		exec "!google-chrome % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'vimwiki'
		exec "MarkdownPreview"
	elseif &filetype == 'javascript'
		exec "!time -p node %"
	endif
endfunc

"cursor changing between Normal mod and Insert mode
if has("autocmd")
	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
	au InsertEnter,InsertChange *
				\ if v:insertmode == 'i' |
				\   silent execute '!echo -ne "\e[5 q"' | redraw! |
				\ elseif v:insertmode == 'r' |
				\   silent execute '!echo -ne "\e[3 q"' | redraw! |
				\ endif
	au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif


" _            _
"| |_   _  ___| | ___   _
"| | | | |/ __| |/ / | | |
"| | |_| | (__|   <| |_| |
"|_|\__,_|\___|_|\_\\__, |
"                   |___/
"
