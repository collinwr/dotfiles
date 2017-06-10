set expandtab       " replace hard tabs with spaces 
set shiftwidth=2    " tab width = 2 spaces
set tabstop=2      
set number          " show line number
set cursorline      " highlight current line
set hlsearch        " highlights current search
set relativenumber

set autoindent


filetype plugin indent on
syntax on

set backspace=eol,start

let &t_Co=256

set runtimepath=~/dotfiles/vim,$VIMRUNTIME

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

