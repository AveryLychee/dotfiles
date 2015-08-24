set nocompatible
syntax on
filetype plugin indent on
set wrap
set linebreak
" set smartindent
set tabstop=4
set shiftwidth=4
set smarttab
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set relativenumber
set backspace=2
set encoding=utf-8
set formatoptions=tcrq
set mouse=a
set wildmenu
set wildmode=list:longest,full

" Persistent undo
set undofile
set undodir=/home/yourname/.vim/.vimundo


match ErrorMsg '\s\+$'


" plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/bling/vim-airline'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/edkolev/promptline.vim'
" Plug 'https://github.com/benekastah/neomake'
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'justinmk/vim-sneak'
Plug 'https://github.com/w0ng/vim-hybrid'
" Plug 'https://github.com/nanotech/jellybeans.vim'
" Plug 'https://github.com/romeovs/creep'
Plug 'https://github.com/tpope/vim-endwise'
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/jondkinney/dragvisuals.vim'
Plug 'https://github.com/Valloric/YouCompleteMe'
Plug 'https://github.com/rking/ag.vim'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/xolox/vim-misc'
Plug 'https://github.com/xolox/vim-easytags'
Plug 'https://github.com/rhysd/vim-crystal'

call plug#end()



" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set t_co=256
set timeoutlen=100

" Colorscheme
set background=dark
colorscheme hybrid


" Syntastic!
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" ycm
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Some mappings
let mapleader = "\\"
let maplocalleader = "\\"
nnoremap <bs> :call SloMoMode()<CR><leader>
nnoremap <leader>j ddp
nnoremap <leader>k ddkP
inoremap <leader>d <esc>ddi
inoremap <leader>u <esc>viwU<esc>i

nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>gv

nnoremap <leader>nh :nohlsearch<cr>

nnoremap <leader>lc :lclose<cr>


vmap <expr> <c-LEFT> DVB_Drag('left')
vmap <expr> <c-RIGHT> DVB_Drag('right')
vmap <expr> <c-DOWN> DVB_Drag('down')
vmap <expr> <c-UP> DVB_Drag('up')

function! SloMoMode()
	if &timeoutlen == 50
		set timeoutlen=2000
		echo "Slo mo mode"
		return "\\"
	else
		set timeoutlen=50
		echo "Hi speed mode"
	endif
endfunction

" Specifically for rpg notes:
nnoremap <leader>sn :iabbrev Ha Hakim<cr>:iabbrev Fr Fredrick<cr>:iabbrev Ae Aelita<cr>:iabbrev As Aswald<cr>:iabbrev Ad Aderyn<cr>:iabbrev Ys Ystlum<cr>:iabbrev Sh Shamus<cr>:iabbrev Je Jean<cr>:iabbrev Ya Yass<CR>:iabbrev Ac Azure Concord<cr>:iabbrev Ash Ashe<cr>:iabbrev ps £<cr>


" Some filetype associations
au BufnewFile,BufRead *.bf setlocal ft=befunge
au BufnewFile,BufRead *.b98 setlocal ft=befunge
au BufWritePost *.cpp Neomake

" Always update tags after write
let g:easytags_events = ['BufWritePost']

" Comments!
au FileType c,cpp nnoremap <buffer> <localleader>c I//<esc>
au FileType sh nnoremap <buffer> <localleader>c I#<esc>
au FileType vim nnoremap <buffer> <localleader>c I"<esc>

au FileType ruby setlocal shiftwidth=2
au FileType ruby setlocal tabstop=2

au FileType haskell setlocal shiftwidth=2
au FileType haskell setlocal tabstop=2


" Some dmenu stuff
" Strip the newline from the end of a string 
function! Chomp(str)
   return substitute(a:str, '\n$', '', '') 
endfunction 

" Find a file and pass it to cmd 
function! DmenuOpen(cmd) 
	let fname = Chomp(system("fzf | dmenu -i -l 20 -p " . a:cmd)) 
	if empty(fname) 
		return 
	endif 
	execute a:cmd . " " . fname 
endfunction
