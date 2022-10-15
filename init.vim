"-------------------------------------------------------------------------
""                           for plugin
"-------------------------------------------------------------------------
let g:plug_timeout = 300

call plug#begin('~/.config/nvim/plugged')
	Plug 'preservim/nerdtree'                               "プラグイン管理用
	Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}   "自動補間
	Plug 'itchyny/calendar.vim'
	"カレンダー 
	Plug 'vim-syntastic/syntastic'
	"文法ミスのハイライト
	Plug 'godlygeek/tabular'
	"以下MarkDownのため
	Plug 'plasticboy/vim-markdown'
	Plug 'previm/previm'
    Plug 'daeyun/vim-matlab'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype plugin on "for netrw
"-------------------------------------------------------------------------
""                           for coc.nvim
"-------------------------------------------------------------------------
let g:coc_global_extensions = [
    \'coc-clangd',
    \'coc-pyright'
    \]
"-------------------------------------------------------------------------
"                           markdown settings
"-------------------------------------------------------------------------
let g:previm_open_cmd = '/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe'
"MarkDownでブラウザ表示させるためのパス
let g:previm_wsl_mode = 1
"WSLでprevimを用いてブラウザ表示させるための設定


"--------------------------------------------------------------------------
"                            general settings
"--------------------------------------------------------------------------
silent! helptags ALL
syntax on
"シンタックスハイライトを有効化
filetype plugin indent on
"ファイルタイプに基づいたインデントを有効化
set foldmethod=indent       "インデントでたたむ
set autoindent
"新しい行を始めるときに自動でインデント 
set expandtab               "タブをスペースに変換
set tabstop=4
"タブをスペース四文字とカウント
set shiftwidth=4
"自動インデントに使われるスペースの数を四に設定
set backspace=2
"バックスペースの挙動を修正
set termguicolors
"tmuxなどのカラースキームを修正
colorscheme torte           "カラースキームを設定
set number                  "行数を追加
set clipboard=unnamed,unnamedplus 
"クリップボードに*pでコピーするため
set laststatus=2
"ステータスラインを常時表示
set showcmd
"最後に実行したコマンドをステータスラインに表示
set cursorline
"カーソルが居る行にラインを表示
set cursorcolumn
"カーソルが居る列にラインを表示
"
"--------------------------------------------------------------------------
"                           leader key settings
"--------------------------------------------------------------------------
let mapleader = "-"
"リーダーキーを-に設定
nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
"-evでMYVIMRCを開く
nnoremap <leader>sv :source $MYVIMRC<cr>
"-svでMYVIMRCを実行
set showmatch               "カッコ()を対応づける
set matchtime=1
"対応するカッコへカーソルが飛ぶ時間を0.1秒に設定
set pumheight=10
"補完のポップアップメニューの高さを設定


" >^.^<
"--------------------------------------------------------------------------
"                           for Lua script
"--------------------------------------------------------------------------
command! Scratch lua require'tools'.makeScratch()

"--------------------------------------------------------------------------
"                           for clip board in WSL
"--------------------------------------------------------------------------
if system('uname -a | grep microsoft') != ''
    augroup myYank
        autocmd!
        autocmd TextYankPost * :call system('clip.exe', @")
    augroup END
endif"
