"================================================================
" 用vim-plug做插件管理系统
" Use vim-plug for plugin manager
"================================================================
let mapleader="\<Space>"
call plug#begin()
	Plug 'Valloric/YouCompleteMe'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'easymotion/vim-easymotion'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/syntastic'
	Plug 'Yggdroot/indentLine'
	Plug 'terryma/vim-expand-region'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
call plug#end()


"================================================================
" YouCompleteMe的配置
" Config for YouCompleteMe
"================================================================
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
" 当离开插入模式时，关闭preview窗口
" Close the preview window when you leave insert mode
let g:ycm_autoclose_preview_window_after_insertion=1
"autocmd InsertLeave * if pumvisible()==0|pclose|endif
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" <leader>+d 跳转到定义
" <leader>+d Jump to definition
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>


"================================================================
" 让vim打开时回到上次编辑的位置
" Move to the point you edited last time when you start vim 
"================================================================
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
			\	exe "normal g'\"" |
			\ endif


"===============================================================
" 普通的一些配置
" Some normal configs
"===============================================================
set incsearch
set encoding=utf-8
set cursorline
set number
syntax enable
syntax on
set cindent
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set ignorecase smartcase
set wildmenu
set wildignore=*.o,*~,*.pyc,*.class

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 让C++的public和private的缩进变正常
" To get public or private lable indented
set cinoptions=g0

" 字体和字号
" Font and font size
set guifont=Monaco\ 14 " English
set guifontwide=Microsoft\ Yahei\ 14 "Chinese

" 关闭菜单栏和工具栏
" Close menu and toolbar
set guioptions-=m
set guioptions-=T

" 主题配色，考虑到终端下有些配色显示不正常，故分开设置
" Color scheme, considering that some schemes may display abnormal
" so set them respectively
set t_Co=256
if has('gui_running')
	set background=dark
	colorscheme monokai
else
	colorscheme desert
endif

" 防止中文乱码
" Prevent Chinese character from messy
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5

"===============================================================
" 好用的一些快捷键映射
" Some nice key mappings
"===============================================================
" 当你忘了用sudo打开vim时，仍能保存文件
" Allow saving of files as sudo when you forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %
" <Leader>p = 从系统剪切板粘贴
" <Leader>p = Paste from system clipboard
map <Leader>p "+p
" <Leader>y = 从系统剪切板复制
" 使用visual模式来选择范围，或者不用visual模式默认选择当前行
" <Leader>y = Copy from system clipboard
" Use visual mode to select, or select the current line by default
vnoremap <Leader>y "+y
nnoremap <Leader>y V"+y
" H = 到行首, L = 到行尾
" H = the beginning of the line, L = the end of the line
noremap H ^
noremap L $
vnoremap L g_
" Ctrl+l，Ctrl+h，在插入模式下左右移动光标
" Ctrl+l，Ctrl+h，move the cursor in insert mode
inoremap <C-l> <right>
inoremap <C-h> <left>
" 映射;为:从而进入命令行时不需按shift
" Map ; to : and save a million keystrokes
nnoremap ; :


"===============================================================
" <Leader>hljk 窗口间移动
" <Leader>hljk = Move between windows
"===============================================================
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k


"===============================================================
" Ctrl Left/h & Right/l buffer间切换
" Ctrl Left/h & Right/l cycle between buffers
"===============================================================
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" <Leader>q 关闭当前buffer
" <Leader>q Closes the current buffer
nnoremap <silent> <Leader>q :bd<CR>

" <Leader>Q 关闭当前窗口 
" <Leader>Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

" <Leader>Ctrl+q 强制关闭当前buffer
" <Leader>Ctrl+q Force Closes the current buffer
nnoremap <silent> <Leader><C-q> :bd!<CR>

" 切换buffer时，不让光标每次都移到第一行
" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

" 一直显示Airline
" Always appear Airline
set laststatus=2
" 在preview窗口中不显示airline
" No airline in preview window
let g:airline_exclude_preview = 1
" 显示buffer名
" Display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

"clang-format
map <C-K> :pyf ~/.vim/plugin/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/.vim/plugin/clang-format.py<cr>

"===============================================================
" Easymotion的配置
" Config for Easymotion
"===============================================================
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
"nmap s <Plug>(easymotion-overwin-f2)
" 开启智能大小写，例如a能匹配到a和A，但A只能匹配到a
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
map <Leader>J <Plug>(easymotion-j)
map <Leader>K <Plug>(easymotion-k)
map <Leader>H <Plug>(easymotion-linebackward)
map <Leader>L <Plug>(easymotion-lineforward)
map <Leader>. <Plug>(easymotion-repeat)


"===============================================================
" Ultisnips的配置
" Config for ultisnips
"===============================================================
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
