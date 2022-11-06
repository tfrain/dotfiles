if exists('g:vscode')

else
	execute 'source' fnamemodify(expand('<sfile>'), ':h').'/core/core.vim'
endif


