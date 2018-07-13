call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'szw/vim-tags'
Plug 'thinca/vim-quickrun'
Plug 'lambdalisue/vim-gita'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'jiangmiao/auto-pairs'

call plug#end()


" Use vim-ailine.
let g:airline#extensions#tabline#enabled = 1

" Vim settings.
set number
set hidden
set cursorline
set termguicolors

" Color settings.
set background=dark
colorscheme base16-monokai

" Lint settings.
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1

" Quickrun settings.
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright 8sp"
\   },
\}

" Commands
command! SettingsEdit e ~/.config/nvim/init.vim
command! SettingsReload so ~/.config/nvim/init.vim

" Keybinds
nnoremap <Space>p :Files<CR>
nnoremap <Space>P :Commands<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>@ :TmuxOpenSubPanel<CR>
nnoremap <Space>f :BLines<CR>
nnoremap <Space>kb :NERDTreeToggle<CR>
nnoremap <Space>r :QuickRun<CR>
nnoremap <Space>q :bd<CR>
nnoremap <Space><Up> <C-w><Up>
nnoremap <Space><Down> <C-w><Down>
nnoremap <Space><Right> <C-w><Right>
nnoremap <Space><Left> <C-w><Left>
