" ~/.vimrc
"
" Requires Vim9+ and `ripgrep`.

" Install `vim-plug` for plugin management if not found. Manage with the
" following commands:
" - :PlugInstall
" - :PlugUpdate
" - :PlugClean
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Enable plugins via vim-plug.
call plug#begin()
Plug 'editorconfig/editorconfig-vim'  " File encodings, indentation, etc.
Plug 'tpope/vim-sensible'  " Sensible settings.
Plug 'tpope/vim-surround'  " Better surround motions.
Plug 'easymotion/vim-easymotion'  " Better navigation motions.
Plug 'airblade/vim-rooter'  " Auto-cd to project root if any.
Plug 'mhinz/vim-signify'  " VCS gutter signs for changed lines.
Plug 'doums/darcula'  " IntelliJ dark color scheme.
Plug 'udalov/kotlin-vim'  " Kotlin syntax highlight.
" Better `tmux` integration.
Plug 'christoomey/vim-tmux-navigator'
Plug 'RyanMillerC/better-vim-tmux-resizer'
" Fuzzy searching.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Vim LSP plugins.
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
" Code formatting.
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
call plug#end()

" Store all backups, swap files and undo histories under /var/tmp (they should
" persist across reboots), or fallback to /tmp.
set backupdir=/var/tmp//,/tmp//
set directory=/var/tmp//,/tmp//
set undodir=/var/tmp//,/tmp//

" Use the system clipboard.
set clipboard=unnamedplus

" Always assume unix-style files.
set fileformats=unix

" When wrap is set to off lines will not wrap.
set nowrap

" When set, highlights the current line.
set cursorline

" Print relative line numbers in front of each line.
set relativenumber

" Print the absolute line number in front of the current line.
set number

" Highlight tabs, trailing whitespaces, and overrunning lines.
set list

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Show current mode.
set showmode

" Show command in the last line of the screen.
set showcmd

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" Ignore case in search patterns.
set ignorecase

" When increasing / decreasing indent level, round to nearest multiple of
" shiftwidth.
set shiftround

" Copy indent from current line when starting a new line.
set autoindent

" Do smart autoindenting when starting a new line.
set smartindent

" Open new split panes to right and bottom, which feels more natural.
set splitbelow
set splitright

" When set to "dark", Vim wil try to use colors that look good on a dark
" background.
set background=dark

" Optionally enable a color scheme if the terminal supports at least 256 colors.
" The color scheme must be set after setting the background and enabling syntax.
if &t_Co >= 256
  " Use 256 colors to match terminal theme.
  set t_Co=256
  colorscheme darcula
endif

" Make Esc more responsive.
set timeout ttimeoutlen=10

" Copy until the end of the line. Consistent with D and C.
nnoremap Y y$

" Exit visual mode with q.
vnoremap q <esc>

" Cancels search highlighting in normal mode.
nnoremap ; :nohlsearch<CR>

" Set <leader> and macro autocompletion keys. Must not have surrounding spaces.
noremap <space> <nop>
let mapleader=" "
set wildcharm=<C-z>

" Writes all buffers before navigating outside of Vim.
let g:tmux_navigator_save_on_switch=1

" If Vim is the zoomed pane, wraps around Vim instead of unzooming.
let g:tmux_navigator_disable_when_zoomed=1

" Panes should be resized in increments of 5.
let g:tmux_resizer_resize_count=5
let g:tmux_resizer_vertical_resize_count=5

" Required to map the Alt key.
for key in "hjkl="
  execute "set <M-" . key . ">=\e" . key
endfor

" Control and navigate panes and tabs:
" - Ctrl-o (new file in current buffer)
" - Ctrl-t (new tab)
" - Ctrl-s/v (split pane horizontally / vertically)
" - Ctrl-h/j/k/l (navigate panes)
" - Alt-h/j/k/l (resize panes)
" - Alt-= (resize all panes equally)
" - Ctrl-z (close all panes except current one)
" - Ctrl-x (close pane)
" - Ctrl-w (close tab)
nnoremap <C-o> :edit %:p:h<C-z>
nnoremap <C-t> :tabedit %<CR>
nnoremap <C-s> :split<CR>
nnoremap <C-v> :vsplit<CR>
nnoremap <M-=> <C-w>=
nnoremap <C-z> :only<CR>
nnoremap <C-x> :quit<CR>
nnoremap <C-w> :tabclose<CR>

" Fuzzy searching:
" - ss (search everywhere)
" - sf (search files)
" - sc (search uncommitted Git files)
" - sb (search current buffer)
" - Ctrl-n/p (cycle options)
" - Enter (open option in current buffer)
" - Ctrl-t (open option in new tab)
" - Ctrl-s/v (open option in horizontal / vertical split)
" - Ctrl-c / Esc (cancel)
nnoremap s <nop>
nnoremap ss :Rg<CR>
nnoremap sf :Files<CR>
nnoremap sc :GFiles?<CR>
nnoremap sb :BLines<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Navigation actions:
" - g1 /g2 / ... / g9 (go to tab)
" - gj / gk (go to previous / next location)
" - gd (go to definition)
" - gD (go to declaration)
" - gi (go to implementation)
" - gf (go to file under cursor or selected file)
" - go (open URI under cursor or selected URI)
" - <leader><leader> + motion (trigger EasyMotion)
nnoremap g1 1gt
nnoremap g2 2gt
nnoremap g3 3gt
nnoremap g4 4gt
nnoremap g5 5gt
nnoremap g6 6gt
nnoremap g7 7gt
nnoremap g8 8gt
nnoremap g9 9gt
nnoremap gj <C-o>
nnoremap gk <C-i>
nmap gd <plug>(lsp-definition)
nmap gD <plug>(lsp-declaration)
nmap gi <plug>(lsp-implementation)
map go gx

" Jump actions:
" - [t / ]t (jump to previous / next tab)
" - [c / ]c / [C / ]C (jump to previous / next / first / last changed hunk)
" - [r / ]r (jump to previous / next reference)
" - [e / ]e (jump to previous / next error)
" - [w / ]w (jump to previous / next warning)
" - [d / ]d (jump to previous / next diagnostic)
" - { / } (jump to previous / next blank line)
" - Ctrl-u/d (jump half page up / down)
nnoremap [t gT
nnoremap ]t gt
nmap [r <plug>(lsp-previous-reference)
nmap ]r <plug>(lsp-next-reference)
nmap [e <plug>(lsp-previous-error)
nmap ]e <plug>(lsp-next-error
nmap [w <plug>(lsp-previous-warning)
nmap ]w <plug>(lsp-next-warning)
nmap [d <plug>(lsp-previous-diagnostic)
nmap ]d <plug>(lsp-next-diagnostic)

" Show float diagnostics only on cursor hover.
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0

" Code inspection and transformation:
" - <leader>h (show help)
" - <leader>f (find references)
" - <leader>t (type hierarchy)
" - <leader>r (rename)
" - <leader>= (format file or selected range)
" - <leader>q (toggle quickfix pane)
" - Ctrl-[ / Ctrl-] (scroll float)
" - Ctrl-c (close float)
nmap <leader>h <plug>(lsp-hover)
nmap <leader>f <plug>(lsp-references)
nmap <leader>t <plug>(lsp-type-hierarchy)
nmap <leader>r <plug>(lsp-rename)
nnoremap <leader>= :FormatCode<CR>
vnoremap <leader>= :FormatLines<CR>
nnoremap <expr> <leader>q empty(filter(getwininfo(), 'v:val.quickfix'))
  \ ? ":copen\<CR>" : ":cclose\<CR>"
nmap <expr> <C-[> lsp#scroll(-5)
nmap <expr> <C-]> lsp#scroll(+5)

" Code actions shortcuts:
" - <leader>a (trigger code actions)
" - Ctrl-n/p (cycle options)
" - Enter (accept option)
" - Ctrl-c / Esc (cancel)
nmap <leader>a <plug>(lsp-code-action-float)

" Autocomplete shortcuts:
" - Ctrl-Space (trigger autocomplete)
" - Ctrl-n/p (cycle options)
" - Ctrl-e (cancel)
imap <C-@> <C-space>
imap <C-space> <C-x><C-o>

" Enable default autocompletion.
set omnifunc=syntaxcomplete#Complete

function! s:on_lsp_buffer_enabled() abort
  " Enable LSP autocompletion.
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  " Override autocomplete action.
  imap <buffer> <C-space> <plug>(asyncomplete_force_refresh)
endfunction

augroup lsp_install
  au!
  " Call s:on_lsp_buffer_enabled only for languages that have the server
  " registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
