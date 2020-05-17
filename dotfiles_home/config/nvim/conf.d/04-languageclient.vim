lua<<EOF
require'nvim_lsp'.pyls_ms.setup{}


require'nvim_lsp'.ccls.setup{
  init_options = {
    highlight = {
      lsRanges = true;
    }
  },
  on_attach = function() 
    vim.lsp.callbacks['$ccls/info'] = function (_, _, result)
        local progress = math.floor(100-(result['pipeline']['pendingIndexRequests']/result['project']['entries'])*100)
        vim.api.nvim_set_var('ccls_progress', tostring(progress))
    end
    vim.loop.new_timer():start(1000, 1000, vim.schedule_wrap(function()
        vim.lsp.buf_request(0, '$ccls/info')
    end))

  end
}
EOF

let g:ccls_progress = 0

" let g:diagnostic_enable_virtual_text = 1

autocmd BufEnter * lua require'completion'.on_attach()
" autocmd BufEnter * lua require'diagnostic'.on_attach()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
