" .vimrc in working folder
" nnoremap <c-m> :w<cr>:source .vimrc<cr>	<--- defined in global ~/.vimrc

nnoremap <c-h> :make src<cr>
"nnoremap <c-j> :make dbg test<cr>
nnoremap <c-j> :make art<cr>
"nnoremap <c-n> :make -B refs html<cr>
"nnoremap <c-n> :make -B refs html SOURCE='fundamentals.mc' ex=en<cr>
nnoremap <c-n> :make -B refs html SOURCE='intro.mc' ex=en<cr>
