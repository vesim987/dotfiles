colorscheme gruvbox 
hi Normal guibg=NONE ctermbg=NONE
set background=dark 

" Enable italics
let g:gruvbox_italic=1

set diffopt+=vertical
set laststatus=2 " always show status line
set wildmenu " enable command line completion
set showcmd " ...
set noshowmode " dont show mode on last line
set shell=$SHELL " set shell
set title " show filename in window title
set showmatch " show matching brackets etc

set termguicolors " true color support

set number " show numbers on left bar
set relativenumber " ...

set signcolumn=yes " always draw sign column

set showbreak=… " visualize break

set hlsearch " highlight all matches

syntax on
filetype on
filetype plugin indent on

highlight Comment cterm=italic

au FileType qf wincmd J " make quickix window to take whole horizontal bottom space 
