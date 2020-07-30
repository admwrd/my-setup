set exrc
set secure
set nocompatible              " be iMproved, required
filetype off                  " required

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

syntax on

" colorscheme hybrid
if &t_Co > 2 || has("gui_running")
  syntax on
endif

set number
set relativenumber
set spell
set spelllang=en_us

cmap W w
" Ignore case for searching
set ignorecase
set clipboard+=unnamed
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ruler
set title
set cursorline
set wrap
if exists("+colorcolumn")
	set colorcolumn=79
endif
au BufRead,BufNewFile,BufWrite {*.less} set ft=css
let g:hybrid_use_Xresources = 1
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
  augroup END
endif
" Paste mode: don't mess up indentaiton
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

imap <F7> :ConqueTerm zsh<CR>

" Tips and Tricks
" % jump to matching brace/paren/bracket
" ( and ) jump back/forward a sentence
" { and } jump back/forward a paragraph
" ^R^W will drop the current word under the cursor
" ^X^K^N will auto complete from dictionary
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
let g:sparkupExecuteMapping = '<c-e>'
let g:sparkupNextMapping = '<c-n>'

augroup gzip
 autocmd!
 autocmd BufReadPre,FileReadPre *.gz set bin
 autocmd BufReadPost,FileReadPost   *.gz '[,']!gunzip
 autocmd BufReadPost,FileReadPost   *.gz set nobin
 autocmd BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")
 autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
 autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r
 autocmd FileAppendPre      *.gz !gunzip <afile>
 autocmd FileAppendPre      *.gz !mv <afile>:r <afile>
 autocmd FileAppendPost     *.gz !mv <afile> <afile>:r
 autocmd FileAppendPost     *.gz !gzip <afile>:r
augroup END
set backspace=2
" set cryptmethod=blowfish2

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
let g:airline_powerline_fonts = 1
" Stupid font alignment issue. Hide for now
let g:airline_left_sep='▙'
let g:airline_right_sep='▟'

nnoremap <F9> :Hexmode<CR>
inoremap <F9> <Esc>:Hexmode<CR>
vnoremap <F9> :<C-U>Hexmode<CR>
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

set hidden
nnoremap <Right> :bnext<CR>
nnoremap <Left> :bprev<CR>

" Improve autocomplete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

colorscheme peachpuff
