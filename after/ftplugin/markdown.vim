" Turn on concealing of bold, italic markers
set conceallevel=2
set concealcursor=nc

" Org-mode-like extensions to Markdown

if exists(':Switch')
  let b:switch_custom_definitions = [
    \   {
    \     '^\(\s*[-+\*]\) TODO \(.*\)': '\1 DONE \2',
    \     '^\(\s*[-+\*]\) DONE \(.*\)': '\1 WAITING \2',
    \     '^\(\s*[-+\*]\) WAITING \(.*\)': '\1 CANCELED \2',
    \     '^\(\s*[-+\*]\) CANCELED \(.*\)': '\1 \2',
    \     '^\(\s*[-+\*]\) \%(TODO\|DONE\|WAITING\|CANCELED\|\[[ x]\]\)\@!\(.*\)': '\1 TODO \2',
    \   },
    \   {
    \     '^\(\s*\)-- \(.*\)': '\1++ \2',
    \     '^\(\s*\)++ \(.*\)': '\1-- \2',
    \   },
    \   {
    \     '^\(\s*[-+\*]\) \[ \] \(.*\)': '\1 [x] \2',
    \     '^\(\s*[-+\*]\) \[x\] \(.*\)': '\1 [ ] \2',
    \   },
    \ ]

  nnoremap <buffer> <CR> :Switch<CR>
endif

" Smart <Enter> in insert mode
inoremap <buffer><expr> <CR> markdown#OpenLine("\<CR>")

" Also for normal mode o/O
nnoremap <buffer><expr> o markdown#OpenLine("o")
nnoremap <buffer><expr> O markdown#OpenLine("O")

" Promote/demote headings
nnoremap <buffer> <Left> :call markdown#PromoteHeading()<CR>
nnoremap <buffer> <Right> :call markdown#DemoteHeading()<CR>

" Smart dashes
iabbrev <buffer><expr> --- markdown#InsertDashes()
