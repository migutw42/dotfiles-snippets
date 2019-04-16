call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tyru/caw.vim'
Plug 'mattn/emmet-vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'sheerun/vim-polyglot'
Plug 'thinca/vim-quickrun'
Plug 'itchyny/lightline.vim'
Plug 'djoshea/vim-autoread'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()


" Vim settings.
set number
set hidden
set cursorline
set termguicolors
set mouse=a

" clipboard "
set clipboard+=unnamedplus

" Color settings.
set background=dark
colorscheme base16-monokai


let g:quickrun_config={'_': {'split': 'below'}}

" Functions
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

" Commands
command! SettingsEdit e ~/.config/nvim/init.vim
command! SettingsReload so ~/.config/nvim/init.vim
command! MouseOn set mouse=a
command! MouseOff set mouse=
command! MouseToggle call ToggleMouse()
command! SE SettingsEdit
command! SR SettingsReload

" Keybinds
nnoremap <Space>p :Files<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-t> :Files<CR>
nnoremap <Space>/ :BLines<CR>
nnoremap <S-Up> <C-w><Up>
nnoremap <S-Down> <C-w><Down>
nnoremap <S-Right> <C-w><Right>
nnoremap <S-Left> <C-w><Left>
nnoremap <C-q> :bd<CR>


" Keybinds(interactive)
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
