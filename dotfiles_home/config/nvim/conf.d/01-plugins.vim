if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif   

let g:loaded_python3_provider = 0
let g:loaded_python_provider = 0
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

call plug#begin()

Plug 'morhetz/gruvbox'

" Ligtline {
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
" }
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim' 

Plug 'peterhoeg/vim-qml'

" tmux integration for vim        
" Plug 'benmills/vimux' 

" for easy navigation in tmux
" Plug 'christoomey/vim-tmux-navigator'

" Plug 'neomake/neomake'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 

Plug 'inkarkat/vim-SyntaxRange'

" easy commenting motions
Plug 'tpope/vim-commentary'

" detect indent style (tabs vs. spaces)
" Plug 'tpope/vim-sleuth'

" Plug 'wellle/context.vim'
" let g:context_presenter = 'preview'
" let g:context_border_char = '▬'

Plug 'igankevich/mesonic'

Plug 'mboughaba/i3config.vim'

Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" run commands async
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-dispatch'

" NERDTree {
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  " Git integration for nerdtree
  Plug 'Xuyuanp/nerdtree-git-plugin'  
  " Plug 'ryanoasis/vim-devicons'
" }

" GIT {
  " vim-fugitive {
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb' " hub extension for fugitive
  " }
  Plug 'airblade/vim-gitgutter'
" } // GIT

" Asm {
  " Plug 'zchee/deoplete-asm' 
" }

" better version of tagbar
Plug 'liuchengxu/vista.vim'
let g:vista_default_executive = 'nvim_lsp'

" Linters/Formatters {
  " ALE {
         " Plug 'w0rp/ale'
         " let g:ale_linters = {
         " \   'cpp': ['clang-tidy'],
         " \}
  
         " " enable quickfix window
         " let g:ale_set_loclist = 0
         " let g:ale_set_quickfix = 1
         " 
         " " show quickfix window by default
         " let g:ale_open_list = 1
         " 
         " " navigation 
         " nmap <silent> <C-k> <Plug>(ale_previous_wrap)
         " nmap <silent> <C-j> <Plug>(ale_next_wrap) 

  " { // ALE
" } // Linters/Formatters


" Autocomplete {
  " Plug 'Shougo/echodoc.vim' " FIXME: somehow force it to work
  " set cmdheight=1
  " let g:echodoc#enable_at_startup = 1
  " let g:echodoc#type = 'signature'
:
  " Plug 'richq/vim-cmake-completion' " FIXME: doesn't work, probably because of deoplete
  Plug 'neovim/nvim-lsp'
  Plug 'weilbith/nvim-lsp-smag'
  Plug 'haorenW1025/completion-nvim'
  Plug 'haorenW1025/diagnostic-nvim'

  Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'lambdalisue/fern.vim'
  
  " 
  " Plug 'vim-scripts/DoxygenToolkit.vim'
" } Autocomplete


call plug#end()
