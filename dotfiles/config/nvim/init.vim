call plug#begin('~/.local/share/nvim/plugged')

" General {
  set autoread " automatically reload file
  
  set clipboard=unnamedplus " set default clipboard to system one " TODO: it is not the best idea

  set ignorecase " case insensitive searching
  set smartcase " case sensitive searching when pattern contains uppercase letter
  set hlsearch " highlight all matches
  set incsearch " dynamic search
  
  " set splitbelow

  set noerrorbells " disable error bells
  set visualbell " use visual bell

  if (has('nvim'))
    " show results of substition as they're happening
    " but don't open a split
    set inccommand=nosplit
  endif

  if has('mouse') " enable mouse if available
    set mouse=a 
  endif

  set tags='.tags' " set default tag file
  
  set wrap " wrap longer lines
  set wrapmargin=4 " wrap margin
  set linebreak " break at spaces
  set showbreak=… " visualize break
  set autoindent " copy indent from previous line

  set expandtab " replace tabs with spaces
  set smarttab " treat spaces as tabs
  set tabstop=4 " tab size
  set shiftwidth=0 " use tabstop value
  set softtabstop=-1 " use shiftwidth value 
  set shiftround " indent to round multiple of shiftwidth

" } // General

" Apperance {
  set number " show numbers on left bar
  set relativenumber " ...
  
  set diffopt+=vertical
  set laststatus=2 " always show status line
  set wildmenu " enable command line completion
  set showcmd " ...
  set noshowmode " dont show mode on last line
  set shell=$SHELL " set shell
  set title " show filename in window title
  set showmatch " show matching brackets etc

  
  Plug 'morhetz/gruvbox'
  set background=dark

  " Ligtline {
    Plug 'itchyny/lightline.vim'
    Plug 'shinchu/lightline-gruvbox.vim'

    let g:lightline = {
      \  'colorscheme': 'gruvbox',
      \  'active': {
      \    'left': [ [ 'mode', 'paste' ],
      \              [ 'git_branch' ],
      \  	     [ 'readonly', 'file_type', 'file_name' ]],
      \     'right': [ [ 'percent' ], [ 'lineinfo' ],
      \                [ 'file_format', 'filee_ncoding' ]]
      \  },
      \  'component_type': {
      \    'readonly': 'error',
      \  },
      \  'component_function': {
      \    'git_branch': 'LightlineGitBranch',
      \    'file_name': 'LightlineFileName',
      \    'file_encoding': 'LightlineFileEncoding',
      \    'file_type': 'LightlineFileType',
      \    'file_format': 'LightlineFileFormat'
      \  },
      \  'tabline': {
      \    'left': [ [ 'tabs' ] ],
      \    'right': [ [ 'close' ] ]
      \  }
      \ }

    function! LightlineFileName() abort
      let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
      if filename =~ 'NERD_tree'
      	return ''
      endif
      let modified = &modified ? ' +' : ''
      return fnamemodify(filename, ":~:.") . modified
    endfunction
    

    
    function! LightlineFileEncoding()
    	return &fileencoding
    endfunction
    
    function! LightlineFileFormat()
    	return &fileformat
      endfunction
    
    function! LightlineFileType()
    	return &filetype
    endfunction
    
    function! LightlineGitBranch()
    	return (exists('*fugitive#head') ? fugitive#head() : '')
    endfunction
    
    function! LightlineUpdate()
        call lightline#update()
    endfunction
    
    augroup alestatus " FIXME: add ale to lightline
    	autocmd User ALELint call LightlineUpdate()
    augroup end 
  " } // Ligtline
  set t_Co=256

  syntax on
  filetype plugin indent on

  highlight Comment cterm=italic

" } // Appereance

" Mappings {
  
  let mpaleader = ','

  nmap <leader>, :w<cr> 

  noremap <space> :set hlsearch! hlsearch?<cr>

" } // Mappings

" General Plugins {
  " fuzzy finder
  Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore .git -g ""' 
  
  " tmux integration for vim        
  Plug 'benmills/vimux' 
 
  " for easy navigation in tmux
  Plug 'christoomey/vim-tmux-navigator'

  " easy commenting motions
  Plug 'tpope/vim-commentary'
  
  " detect indent style (tabs vs. spaces)
  Plug 'tpope/vim-sleuth'
  
  " tagbar for ctag
  Plug 'majutsushi/tagbar'
 
  " TODO: xxx
  Plug 'xolox/vim-misc'

  " auto ctags FIXME: doesn't work too well
  " Plug 'xolox/vim-easytags'
  " let g:easytags_file = '.tags' " 
 
  " run commands async
  Plug 'skywind3000/asyncrun.vim'

  
  " NERDTree {
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'

    " Toggle NERDTree
    function! ToggleNerdTree()
      if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
        :NERDTreeFind
      else
      	:NERDTreeToggle
      endif
    endfunction
    
    nmap <silent> <leader>k :call ToggleNerdTree()<cr>
    nmap <silent> <leader>y :NERDTreeFind<cr>
    
    let NERDTreeShowHidden=1

  " } // NERDTree
  
  " vim-fugitive {{{
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb' " hub extension for fugitive

    nmap <silent> <leader>gs :Gstatus<cr>
    nmap <leader>ge :Gedit<cr>
    nmap <silent><leader>gr :Gread<cr>
    nmap <silent><leader>gb :Gblame<cr>
  
  " }}}
  
  " C/C++ {
    " LLDB integration
    Plug 'dbgx/lldb.nvim'
    
    " clang-based symbol renaming
    Plug 'uplus/vim-clang-rename'
    
    let g:LanguageClient_serverCommands = {
      \ 'c': ['clangd'],                                                                                                                                                                             
      \ 'cpp': ['clangd']                                                                                                                                                                             
      \ }
    let g:LanguageClient_loadSettings = 1
    let g:LanguageClient_settingsPath = '/home/vesim/.config/nvim/settings.json'

  " } // C/C++
  
  " Build tools {
    Plug 'vhdirk/vim-cmake'

    let g:cmake_export_compile_commands = 1
    let g:cmake_ycm_symlinks = 1

  " } // BuildTools

  " Linters/Formatters {
    " ALE {
      Plug 'w0rp/ale'
       
      " enable quickfix window
      let g:ale_set_loclist = 0
      let g:ale_set_quickfix = 1
      
      " show quickfix window by default
      let g:ale_open_list = 1
      
      " navigation 
      nmap <silent> <C-k> <Plug>(ale_previous_wrap)
      nmap <silent> <C-j> <Plug>(ale_next_wrap) 
      
    " { // Syntastic
    
    " clang-format {
      Plug 'rhysd/vim-clang-format'
      " TODO: add some default config
      
      let g:clang_format#auto_format_on_insert_leave = 1

      autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
      autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
      nmap <Leader>C :ClangFormatAutoToggle<CR>
    " } // clang-format
  " } // Linters/Formatters
  
  " TODO {
    Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ } "
  " } // TODO

  " Autocomplete {
    " Plug 'Shougo/echodoc.vim' " FIXME: somehow force it to work

    " Deoplete {
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      


      let g:deoplete#enable_at_startup = 1
      let g:deoplete#enable_smart_case = 1
      
      autocmd CompleteDone * silent! pclose!
      
      " Clang {
	" Plug 'zchee/deoplete-clang'
	" let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
	" let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/6.0.0/' " TODO: add automaticaly detection of that

	" let g:deoplete#auto_complete_start_length = 1
	" let g:deoplete#sources#clang#sort_algo = 'priority'
	" let g:deoplete#sources#clang#std#cpp = 'c++1z'
      
      " } //Clang

      " Python {
	Plug 'zchee/deoplete-jedi'

	let g:deoplete#sources#jedi#show_docstring = 1
	
	function SetPythonExecutable() " TODO: add checks for venv
	  if getline(1) =~# "#.*python2.*"
	    let g:deoplete#sources#jedi#python_path = '/usr/bin/python2'
	    let g:syntastic_python_python_exec = '/usr/bin/python2'
	  else
	    let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
	    let g:syntastic_python_python_exec = '/usr/bin/python3'
	  endif	
	endfunction
	
	autocmd FileType python call SetPythonExecutable()

      " } // Python
      
      " D {
        Plug 'landaire/deoplete-d'

	function StartDCDServer()
	  let g:deoplete#sources#d#dcd_server_autostart = 1
	endfunction

	autocmd FileType d call StartDCDServer
      
      " } // D
      
      " VimL {
        Plug 'Shougo/neco-vim'

      " } // VimL
    " } // Deoplete
  " } // Autocomplete

  if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
  endif

" } // General Plugins

" CTF {

  function! CTFMode()
    let g:VimuxResetSequence = '^c ^c clear Enter'
    autocmd BufWritePost *.py VimuxRunCommand('python2 ' . @%) " FIXME: use deoplate-jedi config
  endfunction
  command! CTFMode call CTFMode()

" } // CTF

call plug#end()

" TODO: XXX
colorscheme gruvbox 
hi Normal guibg=NONE ctermbg=NONE
      call deoplete#custom#source('LanguageClient', 'min_pattern_length', 1)

