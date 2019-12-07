"============================================================================="
"
"                               ➢基本设置
"
"============================================================================="


set nocompatible                        " use vim mode instead of pure Vi, must be the first instruction

set history=100                         " lines of history VIM has to remember
set so=7                                " set 7 lines to the cursor - when moving vertically using j/k
set autoread                            " auto read when a file is changed from the outside


" display settings
set nu                                   " show line number
set relativenumber                       " relative line number
set encoding=utf-8                       " encoding used for display file
set guifont=Fira\ Code:h12
set ruler                                " show the cursor position all the time
set showmatch                            " highlight matching braces
" set showmode                           " show insert/replace/visual mode
set foldmethod=indent

" window settings
set splitright                           " show at right when spliting

" write settings
set confirm                              " confirm :q in case of unsaved changes
set nobackup                             " do not keep the backup~ file

" edit settings
set backspace=indent,eol,start           " backspacing over everything in the insert mode
set expandtab                            " fill tabs with spaces
set nojoinspaces                         " no extra space after '.' when join lines
set shiftwidth=4                         " set indentation depth to 8 columns
set softtabstop=4                        " backspacing over spaces like over tabs
set tabstop=4                            " set tabulator length to 8 columns
" set wrap
" set textwidth=80                       " wrap lines automatically at 80th column

" search settings
set hlsearch                             " highlight search results
set ignorecase                           " do case insensitive search...
set incsearch                            " do incremental search
set smartcase                            " ...unless capital lettters are used

" for lightline has shown mode
set noshowmode

" file type specific settings
filetype on                              " enable file type detection
filetype plugin on                       " load the plugin for specific file types
filetype indent on                       " automatically indent code

" syntax highlighting
set background=dark
colorscheme gruvbox                      " colorscheme
syntax enable                            " enable syntax highlighting

set updatetime=100                       " update frequency


"============================================================================="
"
"                            ➢个人键盘映射
"
"============================================================================="

let mapleader = "\<Space>"
let maplocalleader = ","

inoremap <c-u> <esc>viwU
nnoremap <c-u> viwU
"nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
"nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel

" 重新打开文件时，回到上一次退出的位置
augroup backtolastpos
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   execute "normal! g`\"" |
                \ endif
augroup END



"============================================================================="
"
"                   Favourite ColorScheme
"
"============================================================================="
" ego, peachpuff, leo, kalt, gruvbox, flattown, lettuce
" getafe




"============================================================================="
"
"                               ➢ 插件中心
"
"============================================================================="

call plug#begin('~/.vim/plugged')

" 语法检查
Plug 'w0rp/ale'                                                         " linter

" coc 补全框架
Plug 'neoclide/coc.nvim', {'branch': 'release'}                         " coc 补全框架

" 补全插件
Plug 'MaskRay/ccls'                                                     " C 系列补全
Plug 'Shougo/echodoc.vim'                                               " 函数文档补全
Plug 'tenfyzhong/CompleteParameter.vim'                                 " 函数参数补全

" tag 相关插件
Plug 'liuchengxu/vista.vim'                                             " 侧边栏显示 tag 结构

" 快速搜索
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }                       " 文件、tag、buffer 搜索(非常快)
Plug 'liuchengxu/vim-clap'                                              " 弹窗搜索各种

"  文件树
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'                                        " 文件图标
Plug 'kristijanhusak/defx-git'                                          " 文件中 git 状态

" git 相关
Plug 'tpope/vim-fugitive'                                               " 集成各种 git 命令
Plug 'mhinz/vim-signify'                                                " 侧边栏显示修改状态(不仅仅支持 git)
"Plug 'airblade/vim-gitgutter'                                           " 侧边栏显示修改状态(仅支持 git)

" 美化
Plug 'mhinz/vim-startify'                                               " 启动页面
Plug 'Yggdroot/indentLine'                                              " 缩进线
Plug 'luochen1990/rainbow'                                              " 彩虹🌈括号
Plug 'liuchengxu/eleline.vim'                                           " status line
Plug 'flazz/vim-colorschemes'                                           " 各种配色方案
Plug 'bronson/vim-trailing-whitespace'                                  " 高亮尾空白
Plug 'octol/vim-cpp-enhanced-highlight'                                 " C++ 语法高亮增强
Plug 'ouzhenkun/vim-tabline'                                            " 显示 tab 信息

" 快速移动
Plug 'easymotion/vim-easymotion'                                        "
Plug 'justinmk/vim-sneak'                                               "
Plug 'andymass/vim-matchup'                                             " 快速匹配跳转，不仅仅匹配符号，还有各种关键字匹配，比如 if-fi

" 原始功能增强
Plug 'mg979/vim-visual-multi'                                           " 多光标操作
Plug 'mbbill/undotree'                                                  " 树形显示历史操作
Plug 'jiangmiao/auto-pairs'                                             " 括号自动匹配
Plug 'junegunn/vim-easy-align'                                          " TODO: 这是啥插件来着？
Plug 'liuchengxu/vim-which-key'                                         " 和 spacemacs 类似的
Plug 'skywind3000/vim-preview'                                          " 预览窗口
Plug 'skywind3000/asyncrun.vim'                                         " 异步运行
Plug 'tpope/vim-commentary'                                             " 快速注释


" Go 语言插件
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" markdown 插件
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " markdown 预览
" nginx 插件
Plug 'spacewander/openresty-vim'
Plug 'chr4/nginx.vim'

" 新插件试用
Plug 'editorconfig/editorconfig-vim'

call plug#end()








"============================================================================="
"
"                               ➢插件配置
"
"============================================================================="

highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black





" ################################################

    "PLUGIN:  Complete Parameter

" ################################################

inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)






" #########################################################

    "PLUGIN: AsyncRun

" #########################################################

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






" #########################################################

    " PLUGIN: ALE

" #########################################################

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




" #########################################################

    "PLUGIN: vim-preview

" #########################################################
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>






" #########################################################

    "PLUGIN: indent line

" #########################################################

let g:indentLine_char = '|'






" #########################################################

    "PLUGIN:  echodoc

" #########################################################
set cmdheight=2
let g:echodoc#enable_at_startup = 1






" #########################################################

    "PLUGIN:  other settings

" #########################################################

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






" #########################################################

    "PLUGIN: Openresty Lua

" #########################################################
autocmd BufRead,BufNewFile nginx_*.conf set filetype=nginx






" #########################################################

    "PLUGIN: Vim-Which-Key

" #########################################################
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
" NOTE: <leader>b 似乎被映射到了 LeaderBuffer 上了
unmap <leader>b

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
    \ 'b': 'buffers'        ,
    \ 'm': 'mru'            ,
    \ 't': 'buftag'         ,
    \ 'l': 'line'           ,
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
let g:which_key_map['g'] = {
    \ 'name' : '+git',
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



call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>







" ################################################
"
"   "PLUGIN: undo-tree
"
" ################################################
nnoremap <Leader>ut :UndotreeToggle<cr>
let g:undotree_WindowLayout = 3
if has("persistent_undo")
    set undodir="$HOME . "/.undodir""
    set undofile
endif







" ################################################
"
"   "PLUGIN: LeaderF
"
" ################################################
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

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>







" ################################################
"
"   "PLUGIN: defx
"
" ################################################
nnoremap <leader>od :Defx -columns=icons:indent:filename:type<CR>
" Avoid the white space highting issue
autocmd FileType defx match ExtraWhitespace /^^/
" Keymap in defx
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
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
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




autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  setl nonumber
  setl norelativenumber
  setl listchars=

  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')

  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')

  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')

  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')

  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')

  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')

  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
"  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open_or_close_tree')

  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')

  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')

  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')

  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:filename:type:size:time')

  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')

  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')

  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')

  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')

  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')

  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')

  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')

  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')

  nnoremap <silent><buffer><expr> h
  \ defx#is_opened_tree() ? defx#do_action('close_tree') :defx#do_action('cd', ['..'])

  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')

  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')

  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'

  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')

  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'

  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'

  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')

  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')

  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')

endfunction



" ################################################
"
"   "PLUGIN: markdown-preview.nvim
"
" ################################################
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0







" ################################################
"
"   "PLUGIN: coc.nvim
"
" ################################################
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif





" ################################################
"
"   "PLUGIN: Vista
"
" ################################################

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
"let g:vista#renderer#icons = {
"\   "function": "\uf794",
"\   "variable": "\uf71b",
"\  }

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()





"" ################################################
"
"   "PLUGIN: rainbow
"
" ################################################
let g:rainbow_active = 1







" ################################################
"
"   "PLUGIN: vim-signify
"
" ################################################
set updatetime=100
let g:signify_sign_change = "~"
