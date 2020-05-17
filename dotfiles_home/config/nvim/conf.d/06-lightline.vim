let g:lightline = {
  \  'colorscheme': 'gruvbox',
  \  'active': {
  \    'left': [ [ 'mode', 'paste' ],
  \              [ 'git_branch' ],
  \  	     [ 'readonly', 'file_type', 'file_name' ]],
  \     'right': [ [ 'percent' ], [ 'lineinfo' ],
  \                [ 'lsp_progress' ]]
  \  },
  \  'component_type': {
  \    'readonly': 'error',
  \  },
  \  'component_function': {
  \    'git_branch': 'LightlineGitBranch',
  \    'file_name': 'LightlineFileName',
  \    'file_encoding': 'LightlineFileEncoding',
  \    'file_type': 'LightlineFileType',
  \    'file_format': 'LightlineFileFormat',
  \    'lsp_progress': 'LighlineLSPProgress'
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

function LighlineLSPProgress()
    if g:ccls_progress == 100
        return "OK"
    else
        return g:ccls_progress . "%"
    endif
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
