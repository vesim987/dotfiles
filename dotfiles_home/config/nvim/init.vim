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
  
  set updatetime=100 " used by CursorHold event, makes Tagbar and some other plugins work much faster

  set signcolumn=yes " always draw sign column
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

  au FileType qf wincmd J " make quickix window to take whole horizontal bottom space 

" } // Appereance

" Mappings {
  
  let mapleader = ','

  nmap <leader>, :w<cr> 

  noremap <space> :set hlsearch! hlsearch?<cr>

" } // Mappings

" General Plugins {
  " fuzzy finder
  " Plug 'ctrlpvim/ctrlp.vim'
  " let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore .git -g ""' 
  Plug 'junegunn/fzf' 
  Plug 'junegunn/fzf.vim' 
  nnoremap <C-p> :Files<Cr>
  let g:vista_fzf_preview = ['right:50%']
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

  Plug 'mboughaba/i3config.vim'

  " auto ctags FIXME: doesn't work too well
  " Plug 'xolox/vim-easytags'
  " let g:easytags_file = '.tags' " 
 
  " run commands async
  Plug 'skywind3000/asyncrun.vim'
  " Plug 'tpope/vim-dispatch'

  " NERDTree {
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    
    " Git integration for nerdtree
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'ryanoasis/vim-devicons'

    " Toggle NERDTree
    function! ToggleNerdTree()
      if @% != "" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
        :NERDTreeFind
      else
      	:NERDTreeToggle
      endif
    endfunction
    
    nmap <silent> <leader>k :call ToggleNerdTree()<cr>
    nmap <silent> <leader>y :NERDTreeFind<cr>
    
    let NERDTreeShowHidden=1

  " } // NERDTree
  
  " GIT {
    " vim-fugitive {
      Plug 'tpope/vim-fugitive'
      Plug 'tpope/vim-rhubarb' " hub extension for fugitive

      nmap <silent> <leader>gs :Gstatus<cr>
      nmap <leader>ge :Gedit<cr>
      nmap <silent><leader>gr :Gread<cr>
      nmap <silent><leader>gb :Gblame<cr>
    
    " }
       
    Plug 'airblade/vim-gitgutter'
  " } // GIT

  " Asm {
    Plug 'zchee/deoplete-asm' 
  " }

  " C/C++ {
    " LLDB integration
    Plug 'dbgx/lldb.nvim'
    
    " clang-based symbol renaming
    Plug 'uplus/vim-clang-rename'
  
    " gtest integration for vim XXX: it is working pretty bad
    Plug 'alepez/vim-gtest'
    
    " rtags integration for vim
    Plug 'lyuts/vim-rtags'

  " } // C/C++
  
    Plug 'liuchengxu/vista.vim'
  
  " Build tools {
    Plug 'vhdirk/vim-cmake'

    let g:cmake_export_compile_commands = 1
    let g:cmake_ycm_symlinks = 1
    
  " } // BuildTools

  " Linters/Formatters {
    " ALE {
"      Plug 'w0rp/ale'
"      let g:ale_linters = {
"      \   'cpp': ['clangtidy'],
"      \}
"       
"      let g:ale_cpp_clang_options = '-std=c++17 -Wall -Weverything -Wextra -Wno-c++98-compat -Wno-cc+98-c++11-c++14-compat -Wno-shadow -Wno-c++98-compat-pedantic -Wno-global-constructors -Wno-gnu-zero-variadic-macro-arguments'
"
"      " enable quickfix window
"      let g:ale_set_loclist = 0
"      let g:ale_set_quickfix = 1
"      
"      " show quickfix window by default
"      let g:ale_open_list = 1
"      
"      " navigation 
"      nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"      nmap <silent> <C-j> <Plug>(ale_next_wrap) 
      
    " { // ALE
    function! OpenFloatingWin()
      let height = &lines - 3
      let width = float2nr(&columns - (&columns * 2 / 10))
      let col = float2nr((&columns - width) / 2)

      "Set the position, size, etc. of the floating window.
      "The size configuration here may not be so flexible, and there's room for further improvement.
      let opts = {
	    \ 'relative': 'editor',
	    \ 'row': height * 0.3,
	    \ 'col': col + 30,
	    \ 'width': width * 2 / 3,
	    \ 'height': height / 2
	    \ }

      let buf = nvim_create_buf(v:false, v:true)
      let win = nvim_open_win(buf, v:true, opts)

      "Set Floating Window Highlighting
      call setwinvar(win, '&winhl', 'Normal:Pmenu')

      setlocal
	    \ buftype=nofile
	    \ nobuflisted
	    \ bufhidden=hide
	    \ nonumber
	    \ norelativenumber
	    \ signcolumn=no
    endfunction
    let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

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
    " Plug 'autozimu/LanguageClient-neovim', {
    "   \ 'branch': 'next',
    "   \ 'do': 'bash install.sh',
    "   \ } "
  " } // TODO

  " Autocomplete {
    Plug 'Shougo/echodoc.vim' " FIXME: somehow force it to work
    set cmdheight=2
    let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'signature'

    Plug 'richq/vim-cmake-completion' " FIXME: doesn't work, probably because of deoplete

    " Deoplete {
    "  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "  
    "  let g:deoplete#enable_at_startup = 1
    "  let g:deoplete#enable_smart_case = 1
    "  
    "  autocmd CompleteDone * silent! pclose!
    "  
    "  " rtags plugin for deoplete
    "  Plug 'rzaluska/deoplete-rtags'
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    fu! C_init()
      setl formatexpr=LanguageClient#textDocument_rangeFormatting()
    endf
    au FileType c,cpp,cuda,objc :call C_init()
    "  " Python {
	"Plug 'zchee/deoplete-jedi'

	" Required for operations modifying multiple buffers like rename.
	set hidden

	let g:LanguageClient_serverCommands = {
	    \ 'sh': ['bash-language-server', 'start'],
	    \ 'c': ['clangd'],
	    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
	    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
	    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
	    \ 'python': ['pyls'],
	    \ 'dockerfile': ['docker-langserver', '--stdio'],
	    \ 'vim': ['vim-language-server', '--stdio'],
	    \ }
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    let g:deoplete#enable_at_startup = 1
    function LC_maps()
      if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
	nnoremap <F5> :call LanguageClient_contextMenu()<CR>
      endif
    endfunction

    autocmd FileType * call LC_maps()
	" Or map each action separately

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
	" Plug 'landaire/deoplete-d'

        " function StartDCDServer()
        "     let g:deoplete#sources#d#dcd_server_autostart = 1
        " endfunction

        " autocmd FileType d call StartDCDServer
      
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
    autocmd BufWritePost *.py :call VimuxRunLastCommand() " FIXME: use deoplate-jedi config
    "autocmd BufWritePost *.py :call VimuxRunCommand('python2 ' . @%) " FIXME: use deoplate-jedi config
  endfunction
  command! CTFMode call CTFMode()

" } // CTF

call plug#end()

let g:clipboard = {
      \   'name': 'wayland-strip-carriage',
      \   'copy': {
      \      '+': 'wl-copy --foreground --type text/plain',
      \      '*': 'wl-copy --foreground --type text/plain --primary',
      \    },
      \   'paste': {
      \      '+': {-> systemlist('wl-paste --no-newline | tr -d "\r"')},
      \      '*': {-> systemlist('wl-paste --no-newline --primary | tr -d "\r"')},
      \   },
      \   'cache_enabled': 1,
      \ }

" TODO: XXX
colorscheme gruvbox 
hi Normal guibg=NONE ctermbg=NONE
" call deoplete#custom#source('LanguageClient', 'min_pattern_length', 1)

