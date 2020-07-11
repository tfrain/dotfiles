"
" (not so) minimal vimrc.小型的 vimrc
"
" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
" vim 不兼容vi 使得vim更强大
set nocompatible

set number                 " 显示行
syntax on                  " Enable syntax highlighting.语法高亮

filetype plugin indent on  " Load plugins according to detected filetype.
                            " 根据检测到的文件类型加载插件
" 加载插件，也就是引用一下插件
so ~/.config/nvim/my.vim

" set leader, 必须加上以下此项，后面插件会用到
let mapleader = " "
let g:mapleader = " "

so ~/.config/nvim/keymap.vim
 
set autoindent             " Indent according to previous line.根据前一行缩进
set expandtab              " Use spaces instead of tabs.使用空格键而非tab键
set softtabstop =4         " Tab key indents by 4 spaces.tab键缩进四个空格 
set shiftwidth  =4         " >> indents by 4 spaces.tab键缩进四个空格
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
" 无需首先保存即可在缓冲区切换
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.始终显示状态栏
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.在命令行中显示当前模式
" 当预期更多时显示已键入的键
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.更快的重绘
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.搜索包裹文件末尾
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

" 显示不可打印的字符
set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.config/nvim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.config/nvim/files/undo/

if !has('nvim')
    set viminfo     ='100,n$HOME/.config/nvim/files/info/viminfo
endif

" 语法
" 先禁用vim-go的文档显示,使用这种方式，或者使用下面的注释方式都可以
let g:go_doc_keywordprg_enabled = 0

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for gotos
" 先禁用vim-go的跳转定义插件
let g:go_def_mapping_enabled = 0

" 设置代码模版触发器，属于ultisnips 的工作
let g:UltiSnipsExpandTrigger       = '<c-j>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" startify 的简单配置 already out
" let g:startify_padding_left = 10 
" 
" let g:startify_custom_header = startify#pad([
"             \'                    .                    '
"             \,'    ##############..... ##############   '
"             \,'    ##############......##############   '
"             \,'      ##########..........##########     '
"             \,'      ##########........##########       '
"             \,'      ##########.......##########        '
"             \,'      ##########.....##########..        '
"             \,'      ##########....##########.....      '
"             \,'    ..##########..##########.........    '
"             \,'  ....##########.#########.............  '
"             \,'    ..################JJJ............    '
"             \,'      ################.............      '
"             \,'      ##############.JJJ.JJJJJJJJJJ      '
"             \,'      ############...JJ...JJ..JJ  JJ     '
"             \,'      ##########....JJ...JJ..JJ  JJ      '
"             \,'      ########......JJJ..JJJ JJJ JJJ     '
"            \,'      ######    .........                '
"             \,'                  .....                  '
"             \,'                    .                    '
"             \     ]) 

" fzf使用悬浮窗
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'
" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.5 } }

let g:buftabline_numbers = 2
let g:buftabline_separators = 1 

let g:quickrun#default_config = {
\ '_': {
    \ "runner":"terminal",
  \ }
\ }
" fzf customize
" 自定义指令
command! -bang -nargs=? -complete=dir Cheats
  \ call fzf#vim#files("~/.cheat", fzf#vim#with_preview(), <bang>0)

" fzf & rg
if executable('rg') 
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '      .shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"启动 Vim 时自动启动
"let g:keysound_enable = 1
"
"" 设置默认音效主题，可以选择：default, typewriter, mario, bubble, sword
"let g:keysound_theme = 'typewriter'
"
"" 设置音量：0-1000
"let g:keysound_volume = 1000

" asynctasks
let g:asynctasks_term_pos = 'bottom'
let g:asyncrun_open = 15
"let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
"let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80
let g:asynctasks_rtp_config = "tasks.ini"

" dashboard
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_shortcut={
      \ 'last_session'       : 'SPC h l',
      \ 'find_history'       : 'SPC h f',
      \ 'find_file'          : 'CTR c p',
      \ 'change_colorscheme' : 'SPC c c',
      \ 'find_word'          : 'SPC s r',
      \ 'book_marks'         : 'SPC h k',
      \ }
let g:dashboard_session_directory = '~/.config/nvim/sessions'
