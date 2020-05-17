for f in split(glob('~/.config/nvim/conf.d/*.vim'), '\n')
  exe 'source' f
endfor

" General {
  set autoread " automatically reload file
  
  set clipboard=unnamedplus " set default clipboard to system one " TODO: it is not the best idea

  set ignorecase " case insensitive searching
  set smartcase " case sensitive searching when pattern contains uppercase letter
  set incsearch " dynamic search
  
  " set splitbelow

  set noerrorbells " disable error bells
  set visualbell " use visual bell

  if (has('nvim'))
    " show results of substition as they're happening
    " but don't open a split
    set inccommand=nosplit
  endif

  set tags='.tags' " set default tag file
  
  set wrap " wrap longer lines
  set wrapmargin=4 " wrap margin
  set linebreak " break at spaces
set autoindent " copy indent from previous line
  set expandtab " replace tabs with spaces
  set smarttab " treat spaces as tabs
  set tabstop=4 " tab size
  set shiftwidth=0 " use tabstop value
  set softtabstop=-1 " use shiftwidth value 
  set shiftround " indent to round multiple of shiftwidth
  
  set updatetime=100 " used by CursorHold event, makes Tagbar and some other plugins work much faster
" } // General

" Apperance {
  set t_Co=256


    let g:vista_fzf_preview = ['right:50%']
" } // Appereance

" CTF {

  function! CTFMode()
    let g:VimuxResetSequence = '^c ^c clear Enter'
    autocmd BufWritePost *.py :call VimuxRunLastCommand() " FIXME: use deoplate-jedi config
    "autocmd BufWritePost *.py :call VimuxRunCommand('python2 ' . @%) " FIXME: use deoplate-jedi config
  endfunction
  command! CTFMode call CTFMode()

" } // CTF
"
let b:current_syntax = ''
unlet b:current_syntax
syntax include @HTML syntax/html.vim

syntax region htmlCode start=#^html:#hs=e+1 end=+^\w+he=s-1,me=s-1
    \ contains=@HTML

let b:current_syntax = ''
unlet b:current_syntax
syntax include @TEX syntax/tex.vim

syntax region texCode start=#^tex:#hs=e+1 end=+^\w+he=s-1,me=s-1
    \ contains=@TEX
