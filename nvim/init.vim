" plugins {{{1
call plug#begin('~/.config/nvim/plugged')

Plug 'voldikss/vim-floaterm'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'crusoexia/vim-monokai'
Plug 'w0ng/vim-hybrid'

Plug 'preservim/nerdcommenter'

Plug 'vim-test/vim-test'
Plug 'puremourning/vimspector'
Plug 'liuchengxu/vista.vim'
Plug 'iberianpig/tig-explorer.vim'

Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'

Plug 'moll/vim-bbye'

call plug#end()

let g:coc_global_extensions = [
      \  'coc-yank'
      \, 'coc-tsserver'
      \, 'coc-snippets'
      \, 'coc-prettier'
      \, 'coc-pairs'
      \, 'coc-fzf-preview'
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
colorscheme monokai
highlight Normal guibg=none

" keybinding {{{1
let mapleader = "\<Space>"

nnoremap <silent> gj G
nnoremap <silent> gk gg
nnoremap <Leader>o :e
nnoremap <silent> <Leader>n :ene<CR>
nnoremap <silent> <Leader>q :Bdelete<CR>
nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

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

nnoremap <silent> <Leader>f     :<C-u>FzfPreviewDirectoryFiles<CR>
nnoremap <silent> <Leader>ff     :<C-u>FzfPreviewProjectFiles<CR>
nnoremap <silent> <Leader>b     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> <Leader>/     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
nnoremap <silent> <Leader>//    :<C-u>FzfPreviewProjectGrep<Space>
nnoremap <silent> <Leader>fc :Commands<CR>
nnoremap <silent> <Leader>fcc :CocFzfList<CR>

" coc.nvim {{{1
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 Import   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Fern {{{1
nnoremap <silent> <leader>t :Fern . -drawer<CR>
nnoremap <silent> <leader>e :Fern . <CR>
let g:fern#renderer = "nerdfont"
