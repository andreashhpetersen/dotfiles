let b:ale_linters = ['flake8']
let b:ale_fixers = [
\ 'remove_trailing_lines',
\ 'isort',
\ 'yapf',
\ 'autopep8',
\ 'trim_whitespace',
\ ]

let g:ale_fix_on_save = 1

inoremap <buffer> db<Tab> import ipdb; ipdb.set_trace()<Esc>

" Generate a docstring for the thing under the cursor (vim-pydocstring)
nmap <buffer> <localleader>d <Plug>(pydocstring)

" Send to the slime target
nnoremap <buffer> <Leader>e :SlimeSend<CR>
vnoremap <buffer> <Leader>e :SlimeSend<CR>
