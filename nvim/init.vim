" plugins {{{1
call plug#begin('~/.config/nvim/plugged')

Plug 'andys8/vim-elm-syntax'
Plug 'antoinemadec/coc-fzf'
Plug 'dart-lang/dart-vim-plugin'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'moll/vim-bbye'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/confirm-quit'
Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
Plug 'w0ng/vim-hybrid'
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vista.vim'
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'

call plug#end()

let g:coc_global_extensions = [
      \  'coc-yank'
      \, 'coc-tsserver'
      \, 'coc-snippets'
      \, 'coc-prettier'
      \, 'coc-pairs'
      \, 'coc-fzf-preview'
      \, 'coc-explorer'
      \, 'coc-rust-analyzer'
      \, ]

" editor {{{1
set termguicolors

set number
set expandtab
set tabstop=2
set shiftwidth=2
set noswapfile
set cursorline
set showtabline=2
set mouse=a
set inccommand=nosplit
colorscheme hybrid
" highlight Normal guibg=none

" keybinding {{{1
let mapleader = "\<Space>"

nnoremap <silent> gj G
nnoremap <silent> gk gg
nnoremap <ESC><ESC> :nohl<CR>
nnoremap <leader>bd :Bdelete<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bb :bprevious<CR>


" folding {{{1
augroup folding
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END


" vim-airline {{{1
let g:airline_theme = 'hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" fzf.vim {{{1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


" fzf-preview {{{1
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.GitFiles<CR>
nnoremap <silent> [fzf-p]f     :<C-u>CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

nnoremap <silent> <Leader>fc :Commands<CR>
nnoremap <silent> <Leader>fcc :CocFzfList<CR>


" coc.nvim {{{1
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> <leader>kb :CocCommand explorer<CR>

" blose {{{1
let g:bclose_no_plugin_maps = 1


" command {{{1
command! SettingsEdit :edit ~/.config/nvim/init.vim
command! SettingsReload :source ~/.config/nvim/init.vim | :AirlineRefresh
