set number
syntax on
filetype plugin on

" Git commit wrapping
au FileType gitcommit set tw=72

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
