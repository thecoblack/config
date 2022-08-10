let mapleader =","
" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'preservim/nerdcommenter'
call plug#end()

set clipboard+=unnamedplus
set mouse=a

map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('nvim')
	let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
else
	let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
endif


let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDToggleCheckAllLines = 1
let g:NERDCommentEmptyLines = 1

"map <C-/> :NERDCommenterToggle<CR>
"nnoremap <C-;> :call NERDComment(0, "toggle")<CR> 

lua require('plugins')
lua require('plugins.telescope')
lua require('plugins.lsp')
lua require('plugins.nvim-cmp')
lua require('plugins.tree')
lua require('plugins.bufferline')

lua require('nvim-lsp-installer')
lua require('settings')
lua require('keymaps')
lua require('maps')
