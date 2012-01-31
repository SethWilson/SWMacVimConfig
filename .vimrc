" Not VI compatible
"set nocompatible

" Editor settings
set number
set hidden
set list
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#7A7A90
highlight SpecialKey guifg=#7A7A90

set runtimepath+=$HOME/.vim/vim-haml
set runtimepath+=$HOME/.vim/vim-fugitive

filetype plugin indent on
syntax on

" Use a 2 space soft tab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set autoindent
set noexpandtab

:silent exe "g:flog_enable"
:silent exe "g:flog_medium_limit=15"
:silent exe "g:flog_high_limit=30"

" Highlight search results
set hlsearch

" Setting ruby as the default make program
set makeprg=ruby\ %

if has("autocmd")
  autocmd bufWritePost .vimrc source $MYVIMRC
endif

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/plugins/yaml.vim

let mapleader = ";"

" Lusty file explorer shortcuts
command! B  :LustyBufferExplorer
command! F  :LustyFilesystemExplorer
command! FH :LustyFilesystemExplorerFromHere
command! BG :LustyBufferGrep

" Run ruby like Textmate
command! FR set filetype=ruby
if has("autocmd") && has("gui_macvim")

    " Unshifted
    au FileType ruby map  <buffer> <D-r>      :RunRuby<CR>
    au FileType ruby imap <buffer> <D-r> <Esc>:RunRuby<CR>

    " Shifted
    au FileType ruby map  <buffer> <D-R>      :RunRuby<CR> <C-w>w
    au FileType ruby imap <buffer> <D-R> <Esc>:RunRuby<CR> <C-w>wa

    " Close output buffer
    au FileType ruby-runner map <buffer> <D-r> ZZ

  endif

" Fuzzy finder shortcuts
nmap <leader>ff :FuzzyFinderTextMate<CR>

" Strip trailing white spaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
map <leader>strip :call <SID>StripTrailingWhitespaces()<CR>

" Enable filetype-specific indenting and plugins
filetype plugin indent on 

" Remap the arrow keys so you can't use them
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Window navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" NERDTree command
"Nerd Tree commands and options
map <Leader>; :NERDTreeToggle<cr>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"Jump to next space character
"nnoremap f f<space>
"vnoremap f f<space>

 " HTML Tidy, http://tidy.sourceforge.net/
 " select xml text to format and hit ,x
 vmap ,x :!tidy -q -i -xml<CR>

