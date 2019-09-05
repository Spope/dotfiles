let g:lightline = {
  \ 'active': {
  \   'right': [
  \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \              [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'syntastic', 'fileformat', 'fileencoding', 'filetype' ]
  \   ]
  \ },
  \ 'colorscheme': 'material_vim',
  \ 'component_expand': {
  \   'syntastic': 'SyntasticStatuslineFlag',
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \   'syntastic': 'error',
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ }
  \ }
