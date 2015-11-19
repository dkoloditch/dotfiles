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
nnoremap <leader>n :NERDTreeToggle<CR>

" Color scheme
color onedark

" Window/tab switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Line movement mods
nnoremap <S-h> <S-^>
nnoremap <S-l> <S-$>

" Redo
nmap r :redo<Enter>
' > /home/vagrant/.vimrc.after

# Vim-Tags (like Ctags)
# sudo yum install -y ctags
# git clone https://github.com/szw/vim-tags.git
