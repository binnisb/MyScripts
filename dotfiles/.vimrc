" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR> 

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
"
set directory=~/.vim/swap,.
set smarttab
set autoindent
set smartindent shiftwidth=2

" Enable cmake with the cvim plugin (http://www.vim.org/scripts/script.php?script_id=213)
let  g:C_UseTool_cmake    = 'yes' 

" Highlight Snakefile syntax in vim
au BufNewFile,BufRead Snakefile set syntax=python
