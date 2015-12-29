#!/bin/sh

# create .janus directory for plugins and such
mkdir /home/vagrant/.janus
cd /home/vagrant/.janus

# janus
curl -L https://bit.ly/janus-bootstrap | bash

# Fuzzy Finder
wget "https://github.com/dkoloditch/dotfiles/blob/master/vim-l9.zip?raw=true"
unzip vim-l9.zip
git clone git@github.com:vim-scripts/FuzzyFinder.git

# janus vimrc.after file for custom key bindings
printf '
" Leader key
let mapleader=","

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Color scheme
color onedark

" Line movement mods
nnoremap <S-h> <S-^>
nnoremap <S-l> <S-$>

" Tab movement mods
nmap <leader>t :tabnew<CR>
map FF :tabprev<CR>
map GG :tabnext<CR>

" Redo
nmap r :redo<Enter>

" Normal mode
imap <leader>j<space> <Esc>

 " Character limit line
set colorcolumn=80

" Turn off search highlighting
" map <leader>oo :noh
' > /home/vagrant/.vimrc.after

# Vim-Tags (like Ctags)
sudo yum install -y ctags
cd /home/vagrant/vagrant_share
ctags -R --exclude=temp --exclude=vendor --exclude=public
