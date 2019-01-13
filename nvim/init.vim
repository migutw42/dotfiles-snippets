call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'lambdalisue/vim-gita'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tyru/caw.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'ElmCast/elm-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/emmet-vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'thinca/vim-quickrun'
Plug 'itchyny/lightline.vim'


call plug#end()


" Vim settings.
set number
set hidden
set cursorline
set termguicolors
set mouse=a

" clip board "
set clipboard+=unnamedplus

" Color settings.
set background=dark
colorscheme base16-monokai

let g:ale_linters = {'ruby': []}

let g:quickrun_config={'_': {'split': 'below'}}
	


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

" Emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
