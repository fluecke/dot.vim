if !exists('g:vimdot_viewer')
    let g:vimdot_viewer = "Skim"
endif

let s:open_command = '!'
if system('uname') =~ 'Darwin'
    let s:open_command = s:open_command . 'open -a "' . g:vimdot_viewer . '" '
endif

function! s:Dotify()
    let thefile = expand("%")
    let theoutfile = expand("%:r") . ".pdf"
    let thecommand = "!dot -Tpdf " . thefile . " -o" . theoutfile
    silent execute thecommand
    echo "Done compiling graph."
endfunction

function! s:OpenPDF()
    let thefile = expand("%")
    let theoutfile = expand("%:r") . ".pdf"
    let thecommand = s:open_command . theoutfile
    silent execute thecommand
endfunction

command! -buffer Dotify call s:Dotify()
command! -buffer OpenPDF call s:OpenPDF()

nmap <silent> <leader>dc :Dotify<CR>
nmap <silent> <leader>dv :OpenPDF<CR>
