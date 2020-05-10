
let b:ale_linters = ['flake8']
let b:ale_fixers = [
\ 'remove_trailing_lines',
\ 'isort',
\ 'yapf',
\ 'autopep8',
\ 'trim_whitespace',
\ ]

let g:ale_fix_on_save = 1

inoremap db<Tab> import ipdb; ipdb.set_trace()<Esc>

nnoremap <Leader>e :SlimeSend<CR>
vnoremap <Leader>e :SlimeSend<CR>
