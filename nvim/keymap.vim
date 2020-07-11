"buffer
nmap <LEADER>b1 <Plug>BufTabLine.Go(1)
nmap <LEADER>b2 <Plug>BufTabLine.Go(2)
nmap <LEADER>b3 <Plug>BufTabLine.Go(3)
nmap <LEADER>b4 <Plug>BufTabLine.Go(4)
nmap <LEADER>b5 <Plug>BufTabLine.Go(5)
nmap <LEADER>b6 <Plug>BufTabLine.Go(6)
nmap <LEADER>b7 <Plug>BufTabLine.Go(7)
nmap <LEADER>b8 <Plug>BufTabLine.Go(8)
nmap <LEADER>b9 <Plug>BufTabLine.Go(9)
nmap <LEADER>b0 <Plug>BufTabLine.Go(10)
nmap <LEADER>bh :<C-U>call startify#insane_in_the_membrane(0)<CR>
nmap <LEADER>bn :<C-U>bnext<CR>
nmap <LEADER>bp :<C-U>bprevious<CR>
nmap <LEADER>bd :<C-U>bdelete<CR>
nmap <LEADER>bl :<C-U>blast<CR>
nmap <LEADER>bf :<C-U>bfirst<CR>
"nmap <LEADER>bt :<C-U>LeaderfBufTag<CR>
nmap <LEADER>bt :<C-U>BTags<CR>
nmap <LEADER>bs :<C-U>Buffers<CR>
nmap <LEADER>bv :<C-U>call commands#BufferSplitVertical()<CR>

" file
nnoremap <silent><LEADER>fs :<C-U>FilesMru --tiebreak=index<CR>
nnoremap <silent><LEADER>ft :<C-U>CocCommand explorer<CR>

" 使用fzfmru来模拟如vscode go to file 那样的文件模糊查找行为
nnoremap <silent><C-P> :<C-U>FilesMru --tiebreak=index<CR>
"inoremap <silent><C-P> <ESC>:<C-U>call CocActionAsync('showSignatureHelp')<CR>

" 进行添加
"set pastetoggle=<F2> " 按<F2>进入粘贴模式，再按退出
inoremap jj <Esc>'^
" json 格式化
" com! FormatJSON %!python3 -m json.tool
" normal 模式下的普通映射
inoremap <c-d> <Esc>ddO
nnoremap <leader>p :PlugInstall<cr>
" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
vnoremap <leader>c "+yy
" n 模式下复制一行到系统剪切板
nnoremap <leader>c "+yy
" n 模式下粘贴系统剪切板的内容
nnoremap <leader>v "+p
nnoremap <leader>w :w<cr>
nnoremap <leader>q :wq<cr>
" help
cnoremap tabh tab h 
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-0> :tablast<CR>
" window
nnoremap <M-.> :<C-U>5wincmd ><CR>
nnoremap <M-,> :<C-U>5wincmd <<CR>
nnoremap <M-=> :<C-U>5wincmd +<CR>
nnoremap <M--> :<C-U>5wincmd -<CR>
" fzf & help & coc-fzf
nnoremap <silent><LEADER>/ :<C-U>Lines <C-R><C-W><CR>
nnoremap <silent><C-F> :<C-U>Rg <C-R><C-W><CR>
nnoremap <silent><C-H> :<C-U>Helptags<CR>
nnoremap <silent><LEADER><LEADER> :<C-U>Commands<CR><C-P>

nnoremap <silent> <Leader>hd  :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <Leader>hc  :<C-u>CocFzfList commands<CR>

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent><Leader>hh :<C-u>History:<CR>
nnoremap <silent><Leader>hk :<C-u>Marks<CR>
nnoremap <silent><Leader>cc :<C-u>Colors<CR>
nnoremap <silent><Leader>hf :<C-u>History<CR>
nnoremap <silent><LEADER>hv :<C-U>Helptags<CR>
nnoremap <silent><LEADER>hm :<C-U>Maps<CR>
nnoremap <silent><LEADER>hs :<C-U>Cheats<CR>

" search
"nnoremap <Leader>sw :<C-U>Rg <C-R><C-W><CR> "=><C-F>
nnoremap <Leader>sr  :<C-U>Rg<CR>
nnoremap <Leader>st :<C-U>Tags<CR>
"nnoremap <Leader>sf :<C-U>FilesMru --tiebreak=index<CR> "=><C-P>
nnoremap <Leader>sf :<C-U>CocList floaterm<CR>

" 使用 easymotion
nmap ss <Plug>(easymotion-s2) 
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

" coc.nvim 这两个配置可以使用tab键来配置信息
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" 使用c-n c-p 下上，enter来确定
inoremap <silent><expr> <C-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

"if exists('*complte_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif


nnoremap <silent>K :<C-U> call CocAction('doHover')<CR>
vnoremap <silent>K :<C-U> call CocAction('doHover')<CR>
" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
  " if (index(['vim','help'], &filetype) >= 0)
    " execute 'h '.expand('<cword>')
  " else
    " call CocAction('doHover')
  " endif
" endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> ]c <Plug>(coc-git-nextchunk)
nmap <silent> [c <Plug>(coc-git-prevchunk)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
nmap <silent> [e <Plug>(coc-diagnostic-previous-error)

" language
vmap <LEADER>lf  :<C-U>Format<CR>
nmap <LEADER>lf  :<C-U>Format<CR>
nmap <silent> <LEADER>lc <Plug>(coc-fix-current)
xmap <silent> <LEADER>lc <Plug>(coc-fix-current)
nmap <silent><LEADER>lr :<C-U>AsyncTask file-run<CR>
nmap <silent><LEADER>lp :<C-U>AsyncTask project-run<CR>
nmap <silent><LEADER>lg :<C-U>TemplateHere<CR>
nmap <silent><LEADER>lt :<C-U>AsyncTaskFzf<CR>
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project','.vim']

" 所生成的数据文件的名称
"let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"let g:quickrun_no_default_key_mappings = 1

"let g:sneak#s_next = 1

" 检测 ~/.cache/tags 不存在就新建
"if !isdirectory(s:vim_tags)
   "silent! call mkdir(s:vim_tags, 'p')
"endif
"
