
" See plugin/bufkill.vim
" use emacs keybind
nmap <C-x>k :BD<CR>
"Write buffer (save)
nnoremap <C-s> :<C-u>write<CR>
"yank to end
nnoremap Y y$
" Whitespace jump (see plugin/whitespace.vim)
nnoremap ]w :<C-u>WhitespaceNext<CR>
nnoremap [w :<C-u>WhitespacePrev<CR>
" Remove spaces at the end of lines
nnoremap <silent> <Space>cw :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" insert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k>  <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <ESC>^i
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"
"insert a newline
inoremap <C-O> <Esc>o
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

" command line alias
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

tnoremap <A-[> <C-\><C-n>

function! s:QuiteVim() abort
  if empty(expand('%:t'))
    execute ":q"
  else
    execute ":wq!"
  endif
endfunction
" Quiet
nnoremap <leader>qq :call <SID>QuiteVim()<CR>
nnoremap <leader>qw <esc>:q!<CR>

"switch window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" settings for resize splitted window
nmap <C-w>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>

" Session management shortcuts (see plugin/sessions.vim)
nmap <Leader>ss :<C-u>CocCommand session.save<CR>
nmap <Leader>sl :<C-u>CocCommand session.load<CR>
