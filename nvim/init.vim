call plug#begin()
Plug 'dense-analysis/ale'                               " Primary   | Ale                          | Syntax errors check
Plug 'vim-airline/vim-airline'                          " Primary   | Airline                      | Statusline
Plug 'vim-airline/vim-airline-themes'                   " Secondary | Airline Themes               | Statusline customization
Plug 'Yggdroot/indentLine'                              " Primary   | Indent Line                  | Tab lines
Plug 'airblade/vim-gitgutter'                           " Primary   | GitGutter                    | Vim git integration
Plug 'frazrepo/vim-rainbow'                             " Primary   | Rainbow                      | Parenthesis colorize
Plug 'jiangmiao/auto-pairs'                             " Primary   | Auto Pairs                   | Auto add pairs
Plug 'tpope/vim-commentary'                             " Primary   | Commentary                   | Easily comment a line
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " Primary   | Coc                          | Auto completion
Plug 'preservim/nerdtree'                               " Primary   | NerdTree                     | File browser
Plug 'Xuyuanp/nerdtree-git-plugin'                      " Secondary | NerdTree Git                 | Nerdtree git integration
Plug 'ryanoasis/vim-devicons'                           " Secondary | DevIcons                     | Vim icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'          " Secondary | NerdTree Syntax Highlighting | Nerdtree Highlighting
Plug 'arcticicestudio/nord-vim'                         " Primary   | Nord Vim                     | Vim nord colorscheme
Plug 'skammer/vim-css-color'                               " Primary   | CSS Color                   | Shows colors visually
call plug#end()

" Vim
set autoread            " Detect if a file have been edited from outside
set noshowmode          " Disable notification mode indicator
set mouse=a             " Enable complete mouse control
set tabstop=8           " Set tab size
set softtabstop=0       " Illusionary tab size 
set expandtab           " Convert tabs into spaces
set shiftwidth=2        " Auto indent code at exit
set smarttab            " Insert blank spaces according to shiftwidth
set encoding=utf-8      " Set UTF-8 encoding
set wrap                " Line wrap
set linebreak           " Prevent words being broken at the end of the line by word wrap
set laststatus=2        " Determines if other windows will have statusline
set ruler               " Show the current line and column number
set number              " Show line numbers
set noerrorbells        " Disable error bells
set confirm             " If not saved, ask if you want to save at exit
set history=1000        " Determines number of saved patters at search history
set noswapfile          " Disable swap file
set hlsearch            " When searching, highlight current word searched

au VimEnter * syntax on " Turn syntax on at Vim start

colorscheme nord        " Vim colorscheme

" Install new plugins pressing F10
nnoremap <F10> :PlugInstall<CR>         
" Update current plugins pressing F9
nnoremap <F9> :PlugUpdate<CR>           
" Go to the next tab pressing Ctrl+PageUp
nnoremap <C-PageUp> :bnext<CR> 
" Go to the previous tab pressing Ctrl+PageDown
nnoremap <C-PageDown> :bprevious<CR> 
" Close current tab pressing Ctrl+W
nnoremap <C-w> :bdelete<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 1
let g:airline_theme = 'deus'

" Ale
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" Coc
let g:coc_global_extensions = [
    \   'coc-emmet',
    \   'coc-html',
    \   'coc-css',
    \   'coc-json',
    \   'coc-yaml',
    \   'coc-eslint',
    \   'coc-jedi',
    \   'coc-tsserver'
    \   ]
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Gitgutter
au VimEnter * GitGutterEnable

" Rainbow
let g:rainbow_active = 1

" Nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = [ '.git' ]
let NERDTreeStatusline = "%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeWinPos = "right"

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

au VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
