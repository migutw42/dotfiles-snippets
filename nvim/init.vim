call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'thinca/vim-quickrun'
Plug 'lambdalisue/vim-gita'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tyru/caw.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

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
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1
let g:ale_sign_column_always = 1

" Quickrun settings.
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright 8sp"
\   },
\}

" Deoplete settings.
let g:deoplete#enable_at_startup = 1


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
command! IDE NERDTreeToggle | TagbarToggle

" Keybinds
nnoremap <Space>p :Files<CR>
nnoremap <Space>F :Files<CR>
nnoremap <Space>P :Commands<CR>
nnoremap <Space>C :Commands<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>B :Buffers<CR>
nnoremap <Space>f :BLines<CR>
nnoremap <Space>/ :BLines<CR>
nnoremap <Space>kb :NERDTreeToggle<CR>
nnoremap <Space>r :QuickRun<CR>
nnoremap <Space>R :QuickRun<CR>
nnoremap <Space>q :close<CR>
nnoremap <Space>Q :close<CR>
nnoremap <Space>s :split<CR>
nnoremap <Space>S :split<CR>
nnoremap <Space>v :vsplit<CR>
nnoremap <Space>V :vsplit<CR>
nnoremap <Space><Up> <C-w><Up>
nnoremap <Space><Down> <C-w><Down>
nnoremap <Space><Right> <C-w><Right>
nnoremap <Space><Left> <C-w><Left>
nnoremap <Space>m :MouseToggle<CR>
nnoremap <ESC><ESC> :noh<CR>

" Golang tag settings.
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
	\ }


" LSP Settings.
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
