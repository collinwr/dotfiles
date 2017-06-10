"#############################################################
"###################### General Config #######################
"#############################################################

" Tabs
set expandtab       " replace hard tabs with spaces 
set shiftwidth=2    " tab width = 2 spaces
set tabstop=2      
set autoindent
set backspace=eol,start

" Line Numbers
set number          " show line number
set cursorline      " highlight current line
set relativenumber

set hlsearch        " highlights current search

" Include other ~/dotfiles/vim files
set runtimepath=~/dotfiles/vim,$VIMRUNTIME

" Syntax
filetype plugin indent on
syntax on


"#############################################################
"########################### Colors ##########################
"#############################################################

let &t_Co=256
set background=dark 


"#############################################################
"########################## Toggles ##########################
"#############################################################

""" Function for ease of use
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

""" Toggles 
MapToggle <F1> relativenumber
MapToggle <F2> hlsearch

