nnoremap <Plug>(pastery_plus_end) :call pastery#line_paste('$', '+')<CR>
nnoremap <Plug>(pastery_default_end) :call pastery#line_paste('$', v:register)<CR>

nnoremap <Plug>(pastery_plus_col) :call pastery#line_paste(col('.'), '+')<CR>
nnoremap <Plug>(pastery_default_col) :call pastery#line_paste(col('.'), v:register)<CR>

if mapcheck('"$P', 'n') == ''
  nmap "$P <Plug>(pastery_default_end)
endif

if mapcheck('"VP', 'n')
  nmap "VP <Plug>(pastery_default_col)
endif
