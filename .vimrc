set nocompatible
filetype on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'
Plugin 'Syntastic'
Plugin 'avakhov/vim-yaml'

" Now we can turn our filetype functionality back on
filetype plugin indent on

" plugin vim-fugitive
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'elzr/vim-json'

" Syntastic settings start
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 1
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0
" Syntastic settings end

" nerdtree start
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * NERDTree | wincmd p
" nerdtree end
set clipboard=unnamed

" -----------------------------
" config for vim-json
au! BufRead,BufNewFile *.json set filetype=json 
augroup json_autocmd
autocmd!
autocmd FileType json set autoindent
autocmd FileType json set formatoptions=tcq2l
autocmd FileType json set textwidth=78 shiftwidth=2
autocmd FileType json set softtabstop=2 tabstop=8
autocmd FileType json set expandtab
autocmd FileType json set foldmethod=syntax
augroup END
"----------end----------------
" ----setRelativeNumber-------
map <Leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
set syntax=on
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
"----------end----------------

" set lcs=eol:$,tab:\ \ ,trail:#
" set list

" scroll with mouse
set mouse=a

" set bg to black & transperancy 
colorscheme torte
