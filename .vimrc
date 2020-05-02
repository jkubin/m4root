" .vimrc in working folder
" nnoremap <c-m> :w<cr>:source .vimrc<cr>	<--- defined in global ~/.vimrc
set errorformat=make:\ ***\ \[%f:%l:%m\]\ Error\ %n,make%*[^:]:\ ***\ \[%f:%l:%m\]\ Error\ %n,m4:%f:%l:%m

"nnoremap <c-j> :make test<cr>
nnoremap <c-j> :make art ex=en<cr>
"nnoremap <c-j> :make new art<cr>
"nnoremap <c-n> :make -B refs html<cr>
"nnoremap <c-n> :make -B refs html SOURCE='fundamentals.mc' ex=en<cr>
nnoremap <c-h> :make src<cr>
nnoremap <c-n> :make -B refs html SOURCE='intro.mc' ex=en<cr>
