" Vim filetype file
if exists("g:did_load_filetypes")
	finish
endif

" my Vimscript file settings {{{
augroup my_filetypedetect
	autocmd!

	autocmd BufNewFile,BufRead *.make,*.mk setlocal filetype=make		" makefile
	autocmd BufNewFile,BufRead *.mc setlocal wrap			" m4 macro configuration

	" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
	autocmd QuickFixCmdPost [^l]* nested cwindow
	autocmd QuickFixCmdPost    l* nested lwindow

	" skeletons: http://vim.wikia.com/wiki/Use_eval_to_create_dynamic_templates
	autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e") | call <SID>CustomizeTemplate()
	autocmd BufNewFile [Mm]akefile silent! execute '0r ~/.vim/templates/'.expand("<afile>") | call <SID>CustomizeTemplate()

augroup END
" }}}


function! <SID>CustomizeTemplate()
	" delete the last empty line
	execute "$d"
	normal 1G

	silent execute "%s/skeletonVIM_CREATION_DATE/" . strftime("%Y\\/%m\\/%d") . "/ge"
	silent execute "%s/skeletonVIM_CREATION_DTIME/" . strftime("%Y\\/%m\\/%d %H:%M") . "/ge"
	silent execute "%s/skeletonVIM_CREATION_TIME/" . strftime("%H:%M") . "/ge"
	silent execute "%s/skeletonVIM_DIRECTORY/" . expand("%:p:h:t") . "/ge"
	silent execute "%s/skeletonVIM_FILE_BASE/" . expand("%:t:r") . "/ge"
	silent execute "%s/skeletonVIM_FILE_EXT/" . expand("%:e") . "/ge"
	silent execute "%s/skeletonVIM_FILE_M4_MACRO/" . toupper(expand("%:t:r")) . "/ge"
	silent execute "%s/skeletonVIM_FILE_MACRO/__" . toupper(expand("%:t:r") . "_" . expand("%:e")) . "/ge"
	silent execute "%s/skeletonVIM_FILE_NAME/" . expand("%:t") . "/ge"

	normal G
endfunction
