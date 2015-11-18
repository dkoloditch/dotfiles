#!/bin/sh

# sudo yum install -y ctags

# create .janus directory for plugins and such
mkdir /home/vagrant/.janus

# Fuzzy Finder
cd /home/vagrant/.janus
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
' > /home/vagrant/.vimrc.after
