"""""""""""""""""""""""""""""""""""""
" Ivan Pilot - Vimrc Configuration "
"""""""""""""""""""""""""""""""""""""

" Reset the $PATH ENV variables to have youcompleteme working.
" This reset the $PATH only for vim.
" The absolute $PATH ENV variable remains the unchanged.
let $PATH = '/Users/iplab/.rbenv/shims:/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/Applications/Postgres.app/Contents/Versions/latest/bin/'

" Vim acts as vim and not vi
set nocompatible

" Make sure encoding is set to utf8.
set encoding=utf8

" Update Vim's change instantly
set updatetime=100


"""""""""""""""""""""""""""""""""""""
" Start Vundle configuration "
"""""""""""""""""""""""""""""""""""""

" Disabled filetype for Vundle
filetype off	"required

" Vundle -> all plugins must be kept between #begin and #end
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-buftabline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'
Plugin 'valloric/youcompleteme'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons' "must be the last plugin
call vundle#end()

" Enable syntax and plugins
filetype plugin indent on
syntax enable

"""""""""""""""""""""""""""""""""""""
" NERDTree configuration "
"""""""""""""""""""""""""""""""""""""

" NerdTree: colors match file extensions
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151516')

let NERDTreeShowHidden = 1

" Open NerdTree when vim starts up
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p


"""""""""""""""""""""""""""""""""""""
" Configuring Nerd Fonts
"""""""""""""""""""""""""""""""""""""

" Use Nerd Font
set guifont=MesloLGMRegularNerdFontComplete:h12


"""""""""""""""""""""""""""""""""""""
" Lightline configuration
"""""""""""""""""""""""""""""""""""""

" Always display the status line
set laststatus=2	"required for lightline

" Add several config to lightline
let g:lightline = {
	\ 'active': {
	\   'left': [ ['mode', 'paste'],
	\             ['gitbranch', 'readonly', 'filename', 'modified' ]]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'fugitive#head'
	\ },
	\ }


"""""""""""""""""""""""""""""""""""""
" Vim gutter configuration
"""""""""""""""""""""""""""""""""""""

" Vim gutter addtional config
autocmd BufWritePost * GitGutter


"""""""""""""""""""""""""""""""""""""
" Syntastic Configuration
"""""""""""""""""""""""""""""""""""""

" Syntastic - Configuration for Syntastic to work.
" Add additional language checkers below if needed.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline:+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_sass_checkers = ['sass']
let g:syntastic_scss_checkers = ['scss']


"""""""""""""""""""""""""""""""""""""
" Editor Configuration File 
"""""""""""""""""""""""""""""""""""""

" Path to editor config file
let g:EditorConfig_exec_path = '~/.editorconfig'


"""""""""""""""""""""""""""""""""""""
" Indent Guides Configuration
"""""""""""""""""""""""""""""""""""""

let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


"""""""""""""""""""""""""""""""""""""
" General Configuration Options for Vim
"""""""""""""""""""""""""""""""""""""

set background=dark
colorscheme monokai
let g:monokai_term_italic = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Make sure backspace does delete in insert mode
set backspace=2

" Set proper tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Deactivate showmode since overlap with lightline plugin
set noshowmode

" Keep 500 items in the history
set history=500

" Show the cursor position
set ruler

" Show incomplete command
set showcmd

" Show a menu when using tab completion
set wildmenu

" Show context around cursor
set scrolloff=5

" Highlight searched keywords and additional element
set hlsearch
set incsearch
set ignorecase
set smartcase

" Turn on line number
set relativenumber

" Implement nice line wrapper
set lbr

" Implement auto indentation based on previous line indentation
set ai

" Add smart closing parentheses, curly braces, etc
set si

" Hide buffers so can switch to various files w/o forcing to save
set hidden

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Enhanced Tag jumping
" Create the `tags` file
command! MakeTags !ctags-R .

