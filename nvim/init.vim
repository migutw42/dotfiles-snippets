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
nnoremap <Space>/ :BLines<CR>
nnoremap <S-Up> <C-w><Up>
nnoremap <S-Down> <C-w><Down>
nnoremap <S-Right> <C-w><Right>
nnoremap <S-Left> <C-w><Left>
nnoremap <C-q> :bd<CR>
nnoremap <C-k><C-b> :NERDTreeToggle<CR>


" Keybinds(interactive)
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" NERDTree
let NERDTreeMinimalUI = 1
