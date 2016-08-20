let mapleader="\<Space>"
"================================================================
"for vundle
"================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'Lokaltog/vim-powerline'
	Plugin 'terryma/vim-multiple-cursors'
	Plugin 'easymotion/vim-easymotion'
	Plugin 'scrooloose/nerdcommenter'
	"Plugin 'Raimondi/delimitMate'
	Plugin 'Yggdroot/indentLine'
	Plugin 'terryma/vim-expand-region'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	" The following are examples of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	" plugin on GitHub repo
	"Plugin 'tpope/vim-fugitive'
	" plugin from http://vim-scripts.org/vim/scripts.html
	"Plugin 'L9'
	" Git plugin not hosted on GitHub
	"Plugin 'git://git.wincent.com/command-t.git'
	" git repos on your local machine (i.e. when working on your own plugin)
	"Plugin 'file:///home/gmarik/path/to/plugin'
	" The sparkup vim script is in a subdirectory of this repo called vim.
	" Pass the path to set the runtimepath properly.
	"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	" Avoid a name conflict with L9
	"Plugin 'user/L9', {'name': 'newL9'}

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line

"================================================================
"for YouCompleteMe 
"================================================================
let g:ycm_global_ycm_extra_conf='~/.ycm_global_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=1
"close the preview window when leaving insert mode.
autocmd InsertLeave * if pumvisible()==0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"goto definition and declaration.
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"================================================================
"normal vimrc:
"="让vim记忆上次编辑的位置
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
			\	exe "normal g'\"" |
			\ endif
"让vim记忆上次编辑的位置===============================================================
set incsearch
set encoding=utf-8
"colorscheme desert
set cursorline
set number
syntax enable
syntax on
set cindent
set shiftwidth=4
set tabstop=4
set autoindent
set ignorecase smartcase
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %
" <Leader>v = Paste
map <Leader>p "+p
" <Leader>c = Copy
vnoremap <Leader>y "+y
nnoremap <Leader>y V"+y
" H = Home, L = End
noremap H ^
noremap L $
vnoremap L g_
inoremap <C-l> <right>
inoremap <C-h> <left>

"------  Window Navigation  ------
" <Leader>hljk = Move between windows
"nnoremap <Leader>h <C-w>h
"nnoremap <Leader>l <C-w>l
"nnoremap <Leader>j <C-w>j
"nnoremap <Leader>k <C-w>k

"------  Buffer Navigation  ------
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" <Leader>q Closes the current buffer
nnoremap <silent> <Leader>q :bd<CR>

" <Leader>Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

" <Leader>Ctrl+q Force Closes the current buffer
nnoremap <silent> <Leader><C-q> :bd!<CR>

" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

"To get public or private lable indented
set cinoptions=g0
"set guifontset=
"set guifont=Consolas\ 16
"set guifont=Inconsolata\ 16
set guifont=Monaco\ 19
set guifontwide=Microsoft\ Yahei\ 19
"Close menu and toolbar
set guioptions-=m
set guioptions-=T
"color scheme
if has('gui_running')
	colorscheme solarized
else
	colorscheme desert
endif
"colorscheme molokai
"if has('gui_running')
	"colorscheme molokai
"else
	"colorscheme desert
"endif
set background=dark
set t_Co=256
let g:molokai_original=1

"clang-format
map <C-K> :pyf ~/.vim/plugin/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/.vim/plugin/clang-format.py<cr>

"GBK
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5

"Powerline
set laststatus=2
let g:Powerline_symbols='unicode'

"easymotion
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>. <Plug>(easymotion-repeat)

"ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
