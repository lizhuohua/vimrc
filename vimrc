" 不使用Vi兼容模式
set nocompatible


"================================================================
" 用vim-plug做插件管理系统
"================================================================
let mapleader="\<Space>"
let maplocalleader = "\\"
call plug#begin()
    Plug 'Valloric/YouCompleteMe'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion'
    Plug 'scrooloose/nerdcommenter'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'terryma/vim-expand-region'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'Chiel92/vim-autoformat'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'w0rp/ale'
    Plug 'tpope/vim-surround'
    Plug 'lilydjwg/fcitx.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'jacoborus/tender.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'wellle/targets.vim'
    Plug 'iamcco/markdown-preview.vim'
    Plug 'iamcco/mathjax-support-for-mkdp'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'lervag/vimtex'
    Plug 'jceb/vim-orgmode'
    Plug 'tpope/vim-speeddating'
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/vim-easy-align'
    Plug 'alpertuna/vim-header'
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'compnerd/arm64asm-vim'
    Plug 'tpope/vim-dispatch'
    Plug 'neomake/neomake'
    Plug 'jiangmiao/auto-pairs'
    Plug 'luochen1990/rainbow'
    Plug 'ryanoasis/vim-devicons'
call plug#end()


"================================================================
" YouCompleteMe的配置
"================================================================
" 默认的配置文件放在vimrc同级目录下
let g:ycm_global_ycm_extra_conf=expand('<sfile>:p:h') . '/ycm_extra_conf.py'
" 关闭配置文件加载提醒
let g:ycm_confirm_extra_conf=0
" 自动关闭preview窗口
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion = 1
" CTRL-O和CTRL-I来前后跳转
" <leader>+d 跳转到定义
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
" <leader>+i 跳转到头文件
nnoremap <leader>i :YcmCompleter GoToInclude<CR>
" <leader>+t 获取变量类型
nnoremap <leader>t :YcmCompleter GetType<CR>
" 自动使用语义补全
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ 'rust': ['::', '.', 're!\w{2}'],
            \ }


"================================================================
" 让vim打开时回到上次编辑的位置
"================================================================
autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \   exe "normal g'\"" |
            \ endif


"===============================================================
" 普通的一些配置
"===============================================================
" 使用鼠标
if has('mouse')
    set mouse=a
endif

" 关闭错误提示音和闪屏
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Gvim下使用右键菜单
set mousemodel=popup

" 修正Windows下退格键删不掉东西的问题
set backspace=indent,eol,start

" 增强的搜索模式
set incsearch
set ignorecase smartcase

" Vim默认使用的字符集
set encoding=utf-8

" 高亮光标所在行
set cursorline

" 显示行号
set number

" 启动代码高亮
syntax enable
syntax on

" 关于缩进的设置
set cindent
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set expandtab

" 增强命令行补全
set wildmenu
set wildignore=*.o,*~,*.pyc,*.class

" 防止Windows下菜单乱码
if has('win32')||has('win64')
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 让C++的public和private的缩进变正常
set cinoptions=g0

" 字体和字号
if has('unix')
    set guifont=Monaco\ for\ Powerline\ 14 " English
    set guifontwide=Microsoft\ Yahei\ 14 "Chinese
elseif has('win32')||has('win64')
    set guifont=Monaco:h14 " English
    set guifontwide=Microsoft\ Yahei\ Mono:h14 "Chinese
endif

" Windows下使用DirectX进行渲染
if has('win32') || has('win64')
    if (v:version == 704 && has("patch393")) || v:version > 704
        set renderoptions=type:directx,level:0.50,
                    \gamma:1.0,contrast:0.0,geom:1,renmode:5,taamode:1
    end
end

" 关闭菜单栏、工具栏以及滚动条
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" 主题配色，考虑到终端下有些配色显示不正常，故分开设置
"set t_Co=256
set termguicolors
let g:onedark_terminal_italics=1
let g:airline_theme='onedark'
if has('gui_running')
    set background=dark
    colorscheme onedark
else
    colorscheme onedark
endif

" 防止中文乱码
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5

" 启用Vim自带的matchit插件
runtime macros/matchit.vim

" 提高终端下的性能
set ttyfast
" neovim不支持该选项，故删去
" set ttyscroll=3
set lazyredraw

" 搜索后按ESC自动关闭高亮显示
" 在终端下会有延迟，GVim正常
" https://stackoverflow.com/questions/11940801/mapping-esc-in-vimrc-causes-bizzare-arrow-behaviour
if has('gui_running')
    nnoremap <silent> <esc> :noh<return><esc>
else
    augroup no_highlight
        autocmd TermResponse * nnoremap <silent> <esc> :noh<return><esc>
        autocmd TermResponse * nnoremap <esc>^[ <esc>^[
    augroup END
end


"===============================================================
" 编辑文本文件时的配置
"===============================================================
" 编辑文本类型时启用拼写检查
autocmd FileType text,markdown setlocal spell spelllang=en,cjk

autocmd FileType text setlocal textwidth=0

" 折行时自动缩进
set breakindent

" 折行时不会把一个单词切开
set linebreak

" 只对一行的前128列做语法高亮，提升响应速度
set synmaxcol=128


"===============================================================
" 好用的一些快捷键映射
"===============================================================
" 当你忘了用sudo打开vim时，仍能保存文件
cmap w!! %!sudo tee > /dev/null %

" <Leader>p = 从系统剪切板粘贴
map <silent> <Leader>p "+p

" <Leader>y = 从系统剪切板复制
" 使用visual模式来选择范围，或者不用visual模式默认选择当前行
vnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>y V"+y

" 对于长行，自动折行后按屏幕行移动而不是实际行
" 对于j、k，若有命令计数，仍按实际行移动
noremap 0 g0
noremap ^ g^
nnoremap $ g$
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" H = 到行首, L = 到行尾
noremap H g^
noremap L g$
vnoremap L g_

" Ctrl+l，Ctrl+h，在插入模式下左右移动光标
inoremap <C-l> <right>
inoremap <C-h> <left>

" 映射;为:从而进入命令行时不需按shift
noremap ; :

" 在命令行中使用类似Bash的快捷键
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" 让Ctrl+p和Ctrl+n也像上下键一样对历史记录进行过滤
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" 选择刚刚粘贴的内容
noremap <silent> gV `[v`]

" 调整缩进后保持在visual模式中
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Y 复制从光标到行尾的内容，从而与D，C命令保持一致
" Y默认是复制一整行，相当于yy
noremap <silent> Y y$

au Filetype rust noremap <F5> :!cargo run<CR>


"===============================================================
" <Leader>hljk 窗口间移动
"===============================================================
" 垂直、水平划分窗口
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <silent> <Leader>s :split<CR>

" 窗口间移动
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

" <Leader>Q 关闭当前窗口
nnoremap <silent> <Leader>q <C-w>c


"===============================================================
" Ctrl Left/h & Right/l buffer间切换
"===============================================================
" 如果当前buffer被修改了，在离开时自动将其设为隐藏
set hidden

" buffer间切换
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" Ctrl+q 关闭当前buffer，仅适用于GVIM
nnoremap <silent> <C-q> :bd<CR>

" <Leader>Ctrl+q 强制关闭当前buffer
nnoremap <silent> <Leader><C-q> :bd!<CR>

" 切换buffer时，不让光标每次都移到第一行
set nostartofline

" <Leader>1/2/3...， 切换buffer 1/2/3...
nnoremap <silent> <Leader>1 :1b<CR>
nnoremap <silent> <Leader>2 :2b<CR>
nnoremap <silent> <Leader>3 :3b<CR>
nnoremap <silent> <Leader>4 :4b<CR>
nnoremap <silent> <Leader>5 :5b<CR>
nnoremap <silent> <Leader>6 :6b<CR>
nnoremap <silent> <Leader>7 :7b<CR>
nnoremap <silent> <Leader>8 :8b<CR>
nnoremap <silent> <Leader>9 :9b<CR>
nnoremap <silent> <Leader>0 :10b<CR>


"===============================================================
" Airline的配置
"===============================================================
" 一直显示Airline
set laststatus=2

" 在preview窗口中不显示airline
let g:airline_exclude_preview = 1

" 顶部显示buffer名
let g:airline#extensions#tabline#enabled = 1

" 显示buffer号码
let g:airline#extensions#tabline#buffer_nr_show = 1

" 使用powerline的字体，需要打好字体补丁
let g:airline_powerline_fonts = 1


"===============================================================
" Easymotion的配置
"===============================================================
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
"nmap s <Plug>(easymotion-overwin-f2)
" 开启智能大小写，例如a能匹配到a和A，但A只能匹配到A
let g:EasyMotion_smartcase = 1
map <Leader>J <Plug>(easymotion-j)
map <Leader>K <Plug>(easymotion-k)
map <Leader>H <Plug>(easymotion-linebackward)
map <Leader>L <Plug>(easymotion-lineforward)
map <Leader>. <Plug>(easymotion-repeat)


"===============================================================
" Ultisnips的配置
"===============================================================
" Ctrl-e触发补全
let g:UltiSnipsExpandTrigger="<c-e>"
" Ctrl-f，Ctrl-b前后移动光标
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"


"===============================================================
" vim-autoformat的配置
"===============================================================
" 使用clang-format，需安装好对应软件包
let g:formatdef_my_custom_clang = "\"clang-format -style=\'{BasedOnStyle: llvm, IndentWidth: 4}\'\""
let g:formatters_cpp = ['my_custom_clang']
let g:formatters_c = ['my_custom_clang']
let g:autoformat_autoindent = 0
" au BufWrite * :Autoformat
noremap <silent> <F3> :Autoformat<CR>


"===============================================================
" NERDTree的配置
"===============================================================
noremap <silent> <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"===============================================================
" vim-indent-guides的配置
"===============================================================
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size=1


"===============================================================
" ale的配置
"===============================================================
" c/c++使用YouCompleteMe进行诊断，故这里留空
let g:ale_linters = {'c': [], 'cpp': [], 'rust': ['rls']}


"===============================================================
" markdown-preview的配置
"===============================================================
let g:mkdp_path_to_chrome = "chromium"

let g:vimtex_latexmk_options = "-xelatex -shell-escape -verbose -pdf -file-line-error -synctex=1 -interaction=nonstopmode"
let g:vimtex_view_general_viewer = "evince"


"===============================================================
" vim-markdown的配置
"===============================================================
let g:vim_markdown_folding_disabled = 1


"===============================================================
" vim-easy-align的配置
"===============================================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"===============================================================
" vim-header的配置
"===============================================================
let g:header_field_author = 'Li Zhuohua'
let g:header_field_author_email = 'lizhuohua1994@gmail.com'
let g:header_auto_add_header = 0
map <F4> :AddHeader<CR>


"===============================================================
" DoxygenToolkit.vim的配置
"===============================================================
let g:DoxygenToolkit_authorName="Li Zhuohua"
let g:doxygen_enhanced_color = 1
map <localleader>da :DoxAuthor<CR>
map <localleader>df :Dox<CR>
map <localleader>db :DoxBlock<CR>
map <localleader>dc a <LEFT><LEFT><LEFT>
