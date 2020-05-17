let mapleader = ','

nmap <leader>, :w<cr> 

" use space to toggle search highlight
noremap <space> :set hlsearch! hlsearch?<cr>

nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>

" enable mouse if available
if has('mouse')
  set mouse=a 
endif

" show fuzzy finder
nnoremap <C-p> :Files<Cr>

" git stuff
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>
