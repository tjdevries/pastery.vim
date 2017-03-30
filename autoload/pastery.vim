" Test text
" hello world
" some text
" here's more text

" 1
" 2
" 3

let s:pastery_leading_space = v:true

""
" Set the leading space to either true or false
function! pastery#leading_space(setting) abort
  let s:pastery_leading_space = a:setting
endfunction

""
" Toggle the leading space
function! pastery#toggle_leading_space() abort
  let s:pastery_leading_space = !s:pastery_leading_space
endfunction

""
" @param  location:
"   if it's a number, it will go to that column and paste
"       i.e. use line_paste(col('.'),'*') to paste what is in your * register
"       in the same column
"   if it's a string, it will perform that movement, and then paste
"       i.e. use line_paste('$', '*') to paste what is in your * register at
"       the end of line for each line
"
" @param reg_name  The register name to pull from
function! pastery#line_paste(location, reg_name) abort
  if type(a:location) == v:t_string
    let l:movement = v:true
  elseif type(a:location) == v:t_number
    let l:movement = v:false
  else
    return
  endif


  for l:item in split(getreg(a:reg_name))
    if l:movement
      call execute('normal! ' . a:location)
    else
      call execute('normal! ' . a:location . '|')
    endif
    let l:execute_string = 'normal! a'
    let l:execute_string .= s:pastery_leading_space ? ' ' : ''
    let l:execute_string .= l:item
    call execute(l:execute_string)
    call execute('normal! j')
  endfor
endfunction
