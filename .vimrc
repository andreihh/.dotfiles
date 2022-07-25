" .vimrc

" Enable the pathogen plugin for plugin management. Keep this declaration at the
" top to avoid problems.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" When set to "dark", Vim wil try to use colors that look good on a dark
" background.
set background=dark

" This option stops Vim from behaving in a strongly Vi -compatible way.
set nocompatible

" When set, highlights the current line.
set cursorline

" Highlight when you exceed the 80 column limit.
set colorcolumn=81

" When wrap is set to off lines will not wrap.
set nowrap

" Show the line and column number of the cursor position.
set ruler

" Show command in the last line of the screen.
set showcmd

" Show current mode.
set showmode

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Print relative line numbers in front of each line.
set relativenumber

" Print the absolute line number in front of the current line.
set number

" Search options:
" - hlsearch: When there is a previous search pattern, highlight all its
" matches.
" - ignorecase: Ignore case in search patterns.
" - incsearch: While typing a search command, show where the pattern, as it was
" typed so far, matches.
set hlsearch ignorecase incsearch

" When set, enables syntax highlighting.
syntax enable

" Allow backspacing over audoindent, line breaks and the start of insert.
set backspace=indent,eol,start

" When increasing/decreasing indent level, round to nearest multiple of
" shiftwidth.
set shiftround

" Copy indent from current line when starting a new line.
set autoindent

" Do smart autoindenting when starting a new line.
set smartindent

" Always assume unix-style files.
set fileformats=unix

" Highlight tabs and trailing whitespaces at the end of line.
set list listchars=tab:>-,trail:.,nbsp:~

" Open new split panes to right and bottom, which feels more natural.
set splitbelow
set splitright

" Sets the terminal to enable 256 colors. This is required to support color
" themes, but may break colors if the terminal doesn't support 256 colors.
"set t_Co=256

" Copy until the end of the line. Consistent with D and C.
nnoremap Y y$

" Cancels search highlighting in normal mode.
nnoremap <Space>/ :nohlsearch<CR><Esc>

" Ctrl-Space should trigger auto-completion.
inoremap <C-Space> <C-N>

" Fix indentation for whole file.
nnoremap <Space>= gg=G

" Curly bracket autocomplete.
" Use <expr>, because unmap is not currently supported in IdeaVIM.
inoremap <expr> {<CR> "{\<CR>}\<Esc>O"

" YouCompleteMe should always popup completion menu.
let g:ycm_min_num_of_chars_for_completion = 0

" Enter accepts autocomplete option.
inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<Esc>a" : "\<CR>"

" Esc closes autocomplete window and exits insert mode.
inoremap <expr> <Esc> pumvisible() ? "\<C-E>\<Esc>" : "\<Esc>"

" Recommended Syntastic settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" Set Syntastic C++ checker default flags.
let g:syntastic_cpp_compiler_options = ' -lm -static -Wall -std=c++0x'

" Syntastic python checker defaults to python3.
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_pylint_exe = 'pylint3'

" Make command
:set makeprg=make\ %<\ LDLIBS=\"-lm\"\ CFLAGS=\"-Wall\ -O2\ -static\ -std=c11\"\ CPPFLAGS=\"-Wall\ -O2\ -static\ -std=c++0x\"

" Mappings
map <F7> <Esc>:w<CR>:make<CR>
map <F8> <Esc>:!time ./%<<CR>
map <F9> <Esc>:w<CR>:make<CR>:!time ./%<<CR>

imap <F7> <Esc>:w<CR>:make<CR>
imap <F8> <Esc>:!time ./%<<CR>
imap <F9> <Esc>:w<CR>:make<CR>:!time ./%<<CR>
