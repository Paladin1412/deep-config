"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-plug                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" 语法检查
Plug 'w0rp/ale'                                             " linter

" coc 补全框架
Plug 'neoclide/coc.nvim', {'branch': 'release'}             " coc 补全框架

" 补全插件
Plug 'MaskRay/ccls'                                         " C 系列补全
Plug 'Shougo/echodoc.vim'                                   " 函数文档补全
Plug 'tenfyzhong/CompleteParameter.vim'                     " 函数参数补全

" tag 相关插件
Plug 'liuchengxu/vista.vim'                                 " 侧边栏显示 tag 结构

Plug 'vhdirk/vim-cmake'

" 快速搜索
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }           " 文件、tag、buffer 搜索(非常快)
Plug 'liuchengxu/vim-clap'                                  " 弹窗搜索各种
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


"  文件树
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }   " 文件树
Plug 'kristijanhusak/defx-icons'                            " 文件图标
Plug 'kristijanhusak/defx-git'                              " 文件中 git 状态

" git 相关
Plug 'tpope/vim-fugitive'                                   " 集成各种 git 命令
Plug 'mhinz/vim-signify'                                    " 侧边栏显示修改状态(不仅仅支持 git)
"Plug 'airblade/vim-gitgutter'                               " 侧边栏显示修改状态(仅支持 git)

" 美化
Plug 'mhinz/vim-startify'                                   " 启动页面
Plug 'Yggdroot/indentLine'                                  " 缩进线
Plug 'luochen1990/rainbow'                                  " 彩虹🌈括号
Plug 'liuchengxu/eleline.vim'                               " status line
Plug 'flazz/vim-colorschemes'                               " 各种配色方案
Plug 'bronson/vim-trailing-whitespace'                      " 高亮尾空白
Plug 'octol/vim-cpp-enhanced-highlight'                     " C++ 语法高亮增强
Plug 'ouzhenkun/vim-tabline'                                " 显示 tab 信息

" 快速移动
Plug 'easymotion/vim-easymotion'                            "
Plug 'justinmk/vim-sneak'                                   "
Plug 'andymass/vim-matchup'                                 " 快速匹配跳转，不仅仅匹配符号，还有各种关键字匹配，比如 if-fi

" 原始功能增强
Plug 'mg979/vim-visual-multi'                               " 多光标操作
Plug 'mbbill/undotree'                                      " 树形显示历史操作
Plug 'jiangmiao/auto-pairs'                                 " 括号自动匹配
Plug 'junegunn/vim-easy-align'                              " TODO: 这是啥插件来着？
Plug 'liuchengxu/vim-which-key'                             " 和 spacemacs 类似的
Plug 'skywind3000/vim-preview'                              " 预览窗口
Plug 'skywind3000/asyncrun.vim'                             " 异步运行
Plug 'tpope/vim-commentary'                                 " 快速注释


" Go 语言插件
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" markdown 插件
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " markdown 预览

" 语法高亮插件
Plug 'spacewander/openresty-vim'
Plug 'chr4/nginx.vim'
Plug 'solarnz/thrift.vim'

" 新插件试用
Plug 'editorconfig/editorconfig-vim'                                    " 这是啥插件来着？

call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           pre-filetype tweaks                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" these are for the xmledit plugin
let xml_use_xhtml = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           reset laputa augroup                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" We reset the laputa augroup. Autocommands are added to this group throughout
" the file
augroup laputa
  au!
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype on             " enable file type detection
filetype plugin on      " load the plugin for specific file types
filetype indent on      " automatically indent code




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 basic                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme gruvbox     " colorscheme
syntax enable           " enable syntax highlighting
set background=dark     " enable for dark terminals
set scrolloff=2         " 2 lines above/below cursor when scrolling
set showmatch           " show matching bracket (briefly jump)
set matchtime=2         " reduces matching paren blink time from the 5[00]ms def
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set undofile            " stores undo state even when files are closed (in undodir)
set cursorline          " highlights the current line
set winaltkeys=no       " turns of the Alt key bindings to the gui menu
set nu                  " show line number
set relativenumber      " relative line number



" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu            " completion with menu
" This changes the default display of tab and CR chars in list mode
set listchars=tab:▸\ ,eol:¬


" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest
set switchbuf=useopen,usetab

" EDITOR SETTINGS
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
" this can cause problems with other filetypes
" see comment on this SO question http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim/234578#234578
"set smartindent         " smart auto indenting
set autoindent          " on new lines, match indent of previous line
set copyindent          " copy the previous indentation on autoindenting
set cindent             " smart indenting for c-like code
set cino=b1,g0,N-s,t0,(0,W4  " see :h cinoptions-values
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set nobackup            " no backup~ files.

set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
set softtabstop=4
set shiftround          " makes indenting a multiple of shiftwidth
set expandtab           " turn a tab into spaces
set laststatus=2        " the statusline is now always shown
set noshowmode          " don't show the mode ("-- INSERT --") at the bottom

" misc settings
set fileformat=unix     " file mode is unix
set fileformats=unix,dos,mac   " detects unix, dos, mac file formats in that order

set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo
                        " file -- 20 jump links, regs up to 500 lines'

set hidden              " allows making buffers hidden even with unsaved changes
set history=1000        " remember more commands and search history
set undolevels=1000     " use many levels of undo
set autoread            " auto read when a file is changed from the outside
set mouse=a             " enables the mouse in all modes
set foldlevelstart=99   " all folds open by default

set foldmethod=indent
set splitright          " show at right when spliting
set confirm             " confirm :q in case of unsaved changes
set nojoinspaces        " no extra space after '.' when join lines


" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of extra
" whitespace
set pastetoggle=<F7>

" Right-click on selection should bring up a menu
set mousemodel=popup_setpos

" With this, the gui (gvim and macvim) now doesn't have the toolbar, the left
" and right scrollbars and the menu.
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a

" this solves the "unable to open swap file" errors on Win7
set dir=~/tmp,/var/tmp,/tmp,$TEMP
set undodir=~/tmp,/var/tmp,/tmp,$TEMP

" Look for tag def in a "tags" file in the dir of the current file, then for
" that same file in every folder above the folder of the current file, until the
" root.
set tags=./tags;/

" turns off all error bells, visual or otherwise
set noerrorbells visualbell t_vb=
au laputa GUIEnter * set visualbell t_vb=


" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" Number of screen lines to use for the command-line
set cmdheight=2

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l
set nohlsearch          " do not highlight searched-for phrases
set incsearch           " ...but do highlight-as-I-type the search string
set gdefault            " this makes search/replace global by default

" enforces a specified line-length and auto inserts hard line breaks when we
" reach the limit; in Normal mode, you can reformat the current paragraph with
" gqap.
set textwidth=80

" this makes the color after the textwidth column highlighted
set colorcolumn=+1

" options for formatting text; see :h formatoptions
set formatoptions=tcroqnj

" This limits the size of the max number of items to show in Vim's popup menu
" (which is used by YouCompleteMe).
set pumheight=10

" Post Vim 7.4, the "new" regexpengine (value 2) is the default and is slower
" than the "old" enginer (value 1), which means syntax highlighting is slow.
" Benchmarked on Vim 8.1.1576 with https://gist.github.com/glts/5646749 and the
" new engine is now faster in almost all benchmarks! So we use value 0, which
" usually picks the new engine unless it detects it would be slower, and then it
" falls back to the old engine.
set regexpengine=0

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
  set macmeta
endif

if has('unnamedplus')
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the "standard" one, and
  " the selection/mouse-middle-click one. Vim sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif

" Auto saving! Having used Intellij IDEA, autosave is the only way to go
set autowriteall
au FocusLost * silent! wa

" Makes neovim GUI's implement 'autoread' like gvim does. See:
"   https://github.com/neovim/neovim/issues/1936
au FocusGained * :checktime


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           More involved tweaks                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Source: https://vi.stackexchange.com/a/456
fun! s:TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun


" TODO: split this into separate plugin
fun! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        execute "Ack " . l:pattern . ' %'
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 mapping                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" my <leader> is space key
let mapleader = "\<Space>"

" my <localleader> is ','
let maplocalleader = ","

"Basically you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>


" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" This is quit all
noremap <leader>q :qa<cr>

" for faster scrolling
" TODO: create a command for scrolling by ~70% of the window height
noremap <m-j> 15gj
noremap <m-k> 15gk

" on macs the alt key is inconvenient to press, so let's also map to ctrl
noremap <c-j> 15gj
noremap <c-k> 15gk

" Switches to the previous buffer that was shown in the current window, but also
" closes the current buffer before switching to the previous one
" noremap <leader>bq <c-^> :bd #<cr>

" Switch to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>

" Toggle and untoggle spell checking
noremap <leader>ss :setlocal spell! spelllang=en_us<cr>

" spelling shortcuts using <leader>
" ]s next misspelled word
" [s previous misspelled word
" zg add to dict
" z= get suggestions
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>su z=


" 重新打开文件时，回到上一次退出的位置
augroup laputa
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   execute "normal! g`\"" |
                \ endif
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 colorscheme                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ego, peachpuff, leo, kalt, gruvbox, flattown, lettuce
" getafe



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 complete-parameter                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 async-run                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自动打开quickfix window，高度为13
let g:asyncrun_open = 13

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置F10 打开/关闭quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" F9 编译单文件
autocmd Filetype c nnoremap <silent> <F9> :AsyncRun clang -Wall "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

autocmd Filetype cpp nnoremap <silent> <F9> :AsyncRun clang++  -std=c++14 -Wall "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

autocmd Filetype lua nnoremap <silent> <F9> :AsyncRun lua "$(VIM_FILEPATH)" "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

autocmd Filetype go nnoremap <silent> <F9> :AsyncRun go run "$(VIM_FILEPATH)" "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" F5 运行
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 ale                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自定义图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

" 不使用ale的补全
let g:ale_completion_enabled = 0

"keep the sign gutter open
let g:ale_sign_column_always = 1

" echo message
" %s is the error message itself
" %linter% is the linter name
" %severity is the severity type
 let g:ale_echo_msg_error_str = 'E'
 let g:ale_echo_msg_warning_str = 'W'
 let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" use quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)

" run lint only on saving a file
" let g:ale_lint_on_text_changed = 'never'
" dont run lint on opening a file
let g:ale_lint_on_enter = 0

" 设置代码检查器
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

" 使用 make -n 来检查编译标志
let g:ale_c_parse_makefile = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-preview                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 indentline                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:indentLine_char = '|'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 eachodoc                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cmdheight=2
let g:echodoc#enable_at_startup = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 openresty                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile nginx_*.conf set filetype=nginx



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-which-key                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set timeoutlen=300

let g:which_key_map =  {}

" `name` 是一个特殊字段，如果 dict 里面的元素也是一个 dict，那么表明一个 group，
" 比如 `+file`, 就会高亮和显示 `+file` 。默认是 `+prefix`.

" =======================================================
" 1. 基于已经存在的快捷键映射，直接使用一个字符串说明介绍信息即可
" =======================================================

nnoremap <silent> <leader>oq :copen<CR>
nnoremap <silent> <leader>ol :lopen<CR>
nnoremap <silent> <leader>ov :Vista coc<CR>
nnoremap <silent> <leader>om :MarkdownPreview<CR>
nnoremap <silent> <leader>ot :rightbelow vertical terminal<CR>

let g:which_key_map['o'] = {
    \ 'name' : '+open'          ,
    \ 'd' : 'defx'              ,
    \ 'v' : 'vista'             ,
    \ 'q' : 'quickfix'          ,
    \ 'l' : 'locationlist'      ,
    \ 't' : 'terminal'          ,
    \ 'm' : 'markdown-preview'  ,
    \ }

" =======================================================
" 2. 不存在相关的快捷键映射，需要用一个 list：
"    第一个元素表明执行的操作，第二个是该操作的介绍
" =======================================================
let g:which_key_map['b'] = {
    \ 'name' : '+buffer' ,
    \ '1' : ['b1'        , 'buffer 1']        ,
    \ '2' : ['b2'        , 'buffer 2']        ,
    \ 'd' : ['bd'        , 'delete-buffer']   ,
    \ 'f' : ['bfirst'    , 'first-buffer']    ,
    \ 'h' : ['Startify'  , 'home-buffer']     ,
    \ 'l' : ['blast'     , 'last-buffer']     ,
    \ 'n' : ['bnext'     , 'next-buffer']     ,
    \ 'p' : ['bprevious' , 'previous-buffer'] ,
    \ '?' : ['Buffers'   , 'fzf-buffer']      ,
    \ }

let g:which_key_map['w'] = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'     , 'other-window']          ,
    \ 'd' : ['<C-W>c'     , 'delete-window']         ,
    \ '-' : ['<C-W>s'     , 'split-window-below']    ,
    \ '|' : ['<C-W>v'     , 'split-window-right']    ,
    \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
    \ 'h' : ['<C-W>h'     , 'window-left']           ,
    \ 'j' : ['<C-W>j'     , 'window-below']          ,
    \ 'l' : ['<C-W>l'     , 'window-right']          ,
    \ 'k' : ['<C-W>k'     , 'window-up']             ,
    \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
    \ 'J' : ['resize +5'  , 'expand-window-below']   ,
    \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
    \ 'K' : ['resize -5'  , 'expand-window-up']      ,
    \ '=' : ['<C-W>='     , 'balance-window']        ,
    \ 's' : ['<C-W>s'     , 'split-window-below']    ,
    \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
    \ '?' : ['Windows'    , 'fzf-window']            ,
    \ }

let g:which_key_map['l'] = {
    \ 'name' : '+lsp'                                            ,
    \ 'f' : ['LanguageClient#textDocument_formatting()'     , 'formatting']       ,
    \ 'h' : ['LanguageClient#textDocument_hover()'          , 'hover']            ,
    \ 'r' : ['LanguageClient#textDocument_references()'     , 'references']       ,
    \ 'R' : ['LanguageClient#textDocument_rename()'         , 'rename']           ,
    \ 's' : ['LanguageClient#textDocument_documentSymbol()' , 'document-symbol']  ,
    \ 'S' : ['LanguageClient#workspace_symbol()'            , 'workspace-symbol'] ,
    \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : ['LanguageClient#textDocument_definition()'     , 'definition']       ,
        \ 't' : ['LanguageClient#textDocument_typeDefinition()' , 'type-definition']  ,
        \ 'i' : ['LanguageClient#textDocument_implementation()'  , 'implementation']  ,
        \ },
    \ }


let g:which_key_map['f'] = {
    \ 'name' : '+LeaderF'   ,
    \ 'f': 'file'           ,
    \ 'b': 'buffer'         ,
    \ 'm': 'mru'            ,
    \ 't': 'buftag'         ,
    \ 'l': 'line'           ,
    \ 's': 'self'           ,
    \ 'r': 'rg'             ,
    \ 'c': 'colorscheme'    ,
    \ 'h': 'help'           ,
    \ 'F': 'function'       ,
    \ 'w': 'window'         ,
    \ 'H': 'history'        ,
    \ 'C': 'command'        ,
    \ 'g': {
        \ 'name': '+gtags'      ,
        \ 'd': 'definition'     ,
        \ 'r': 'references'     ,
        \ 'n': 'next'           ,
        \ 'p': 'previous'       ,
        \ 'o': 'recall'         ,
        \ },
    \ 'a': {
        \ 'name': '+all'        ,
        \ 'b': 'buffer'         ,
        \ 'l': 'line'           ,
        \ 't': 'buftag'         ,
        \ 'F': 'function'       ,
        \ }
    \ }


nnoremap <leader>ne :vsplit $MYVIMRC<CR>
nnoremap <leader>ns :source $MYVIMRC<CR>
let g:which_key_map['n'] = {
    \ 'name'  : '+neovim'   ,
    \ 'e'  : 'edit'         ,
    \ 's'  : 'source'       ,
    \ }


nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>tf :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>

let g:which_key_map['t'] = {
    \ 'name' : '+tab'       ,
    \ 'f'  : 'first tab'    ,
    \ 'l'  : 'last tab'     ,
    \ 'n'  : 'next tab'     ,
    \ 'p'  : 'prev tab'     ,
    \ }


nnoremap <silent> <leader>gdv :Gvdiffsplit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
let g:which_key_map['g'] = {
    \ 'name' : '+git'   ,
    \ 'b'  : 'blame'    ,
    \ 'd'  : {
        \ 'name'  : '+diff'   ,
        \ '|'  : 'vsplit'     ,
        \ },
    \ }


" to navigate diagnostics
nnoremap <silent> <leader>cep <Plug>(coc-diagnostic-prev)
nnoremap <silent> <leader>cen <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nnoremap <silent> <leader>cgd <Plug>(coc-definition)
nnoremap <silent> <leader>cgy <Plug>(coc-type-definition)
nnoremap <silent> <leader>cgi <Plug>(coc-implementation)
nnoremap <silent> <leader>cgr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <leader>cK :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>cla  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>cle  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>clc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>clo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>cls  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent> <leader>clp  :<C-u>CocListResume<CR>

" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>

let g:which_key_map['c'] = {
    \ 'name' : '+coc'           ,
    \ 'K'  : 'document'         ,
    \ 'n'  : 'action next item' ,
    \ 'p'  : 'action prev item' ,
    \ 'e'  : {
        \ 'name'  : '+error'        ,
        \ 'c'  : 'current-error'    ,
        \ 'n'  : 'next-error'       ,
        \ 'p'  : 'prev error'       ,
        \ },
    \ 'g'  : {
        \ 'name' : '+goto'          ,
        \ 'd'  : 'definition'       ,
        \ 'y'  : 'type-definition'  ,
        \ 'i'  : 'implementation'   ,
        \ 'r'  : 'reference'        ,
        \ },
    \ 'l'  : {
        \ 'name'  : '+coclist'      ,
        \ 'a'  : 'diagnostics'      ,
        \ 'e'  : 'extensions'       ,
        \ 'c'  : 'commands'         ,
        \ 'o'  : 'outline'          ,
        \ 's'  : 'symbols'          ,
        \ 'p'  : 'resume-last-list' ,
        \ },
    \ }


inoremap <c-u> <esc>viwU
nnoremap <c-u> viwU
nnoremap <leader>d" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>d' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>d` viw<esc>a`<esc>bi`<esc>lel

let g:which_key_map['d'] = {
    \ 'name'  : '+wrap'         ,
    \ "'"  : 'quotes'           ,
    \ '"'  : 'double quotes'    ,
    \ '`'  : 'back quote'       ,
    \ }


call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>



nnoremap <silent> <leader>zf :GoFmt<cr>
let g:which_key_map['z'] = {
    \ 'name'  : '+z7z8' ,
    \ 'f': 'gofmt'      ,
    \ }



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 undotree                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <Leader>ut :UndotreeToggle<cr>
let g:undotree_WindowLayout = 3
if has("persistent_undo")
    set undodir="$HOME . "/.undodir""
    set undofile
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 leaderf                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutB = "<leader>fb"
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fs :<C-U><C-R>=printf("Leaderf self %s", "")<CR><CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>
noremap <leader>fc :<C-U><C-R>=printf("Leaderf colorscheme %s", "")<CR><CR>
noremap <leader>fF :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
noremap <leader>fh :<C-U><C-R>=printf("Leaderf help %s", "")<CR><CR>
noremap <leader>fw :<C-U><C-R>=printf("Leaderf window %s", "")<CR><CR>
noremap <leader>fH :<C-U><C-R>=printf("Leaderf searchHistory %s", "")<CR><CR>
noremap <leader>fC :<C-U><C-R>=printf("Leaderf command %s", "")<CR><CR>
noremap <leader>fab :LeaderfBufferAll<CR>
noremap <leader>fal :LeaderfLineAll<CR>
noremap <leader>fat :LeaderfBufTagAll<CR>
noremap <leader>faF :LeaderfFunctionAll<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.root']
" TODO: what does these commands do actually?
noremap <leader>fgr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fgd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fgo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fgn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fgp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" noremap <leader>fpd <Plug>(LeaderfGtagsDefinition)
" noremap <leader>fpr <Plug>(LeaderfGtagsReference)
" noremap <leader>fps <Plug>(LeaderfGtagsSymbol)
" noremap <leader>fpg <Plug>(LeaderfGtagsGrep)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 defx.vim                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open defx window
nnoremap <leader>od :Defx -columns=icons:indent:filename:type<CR>
" avoid the white space highting issue
autocmd FileType defx match ExtraWhitespace /^^/
" keymap in defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

" Defx git
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

" Defx icons
" Requires nerd-font, install at https://github.com/ryanoasis/nerd-fonts or
" brew cask install font-hack-nerd-font
" Then set non-ascii font to Driod sans mono for powerline in iTerm2
" disbale syntax highlighting to prevent performence issue
let g:defx_icons_enable_syntax_highlight = 1



call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 markdown-preview.nvim                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 coc.nvim                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" use tab for completion selection
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" S: shift
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-vista                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to
" fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then
" you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it
" as you wish.
"let g:vista#renderer#icons = {
"\   "function": "\uf794",
"\   "variable": "\uf71b",
"\  }



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 rainbow                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-signify                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set updatetime=100
let g:signify_sign_change = "~"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 misc                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shortmess+=c
" https://stackoverflow.com/questions/19580157/to-hide-user-defined-completion-message-at-vim

" 高亮像NOTE这样的单词
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(NOTE\|TODO\|FIXME\|CHANGED\|BUG\|HACK\|PS\|ATTENTION\|QUESTION\|OPTIMIZE\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(INFO\|IDEA\)')
  endif
endif


highlight PMenu ctermfg=0 ctermbg=241 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=237 ctermbg=2 guifg=darkgrey guibg=black
