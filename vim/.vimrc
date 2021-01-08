set number
syntax on
filetype plugin on

" Git commit wrapping
au FileType gitcommit set tw=72

" set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhartington/oceanic-next'
Plug 'liuchengxu/vim-which-key'
call plug#end()

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

if (has("termguicolors"))
 set termguicolors
endif
colorscheme OceanicNext

let mapleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" Define prefix dictionary
let g:which_key_map =  {}
