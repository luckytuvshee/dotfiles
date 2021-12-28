" PDF Viewer:
" http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0

" Ignore mappings
let g:vimtex_mappings_enabled = 0

" Error Suppression:
" https://github.com/lervag/vimtx/blob/master/doc/vimtex.txt

let g:vimtex_log_ignore = [
        \ 'Underfull',
        \ 'Overfull',
        \ 'specifier changed to',
        \ 'Token not allowed in a PDF string',
      \ ]

let g:vimtex_context_pdf_viewer=1
let g:vimtex_context_pdf_viewer= 'evince'


