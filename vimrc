set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)


Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Bundle 'davidhalter/jedi'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'klen/python-mode'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" enable docstring for folded code
let g:SimpylFold_docstring_preview=1

" python file settings
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=120 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

au BufNewFile,BufRead *.js
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
	    \ set autoindent 

au BufNewFile,BufRead *.html
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
	    \ set autoindent 

au BufNewFile,BufRead *.css
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
	    \ set autoindent 

au BufNewFile,BufRead *.tpl
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
	    \ set autoindent 
" Flagging Unnecessary Whitespace 
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8
set shiftwidth=4
set softtabstop=4

" auto-completer 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" python highlight
let python_highlight_all=1
syntax on

" color schemes
"if has('gui_running')
"    set background=darkred
"    colorscheme solarized
"else
"    colorscheme zenburn    
"endif    
"call togglebg#map("<F5>")

" ignore file in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] 
map <F2> :NERDTreeToggle<CR>

set nu

" make backspaces more powerful
set backspace=indent,eol,start

" system clipboard
set clipboard=unnamed

" Keep indentation level from previous line:
autocmd FileType python set autoindent

"Folding based on indentation:
autocmd FileType python set foldmethod=indent

let g:ycm_python_binary_path='/Users/ligulfzhou/py35env/bin/python3'

" By default, JSX syntax highlighting and indenting will be enabled only for
" files with the .jsx extension. If you would like JSX in .js files, add
let g:jsx_ext_required = 0
