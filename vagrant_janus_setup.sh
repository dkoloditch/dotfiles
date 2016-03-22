#!/bin/sh

# install unzip
sudo yum -y install unzip

# create .janus directory for plugins and such
mkdir /home/vagrant/.janus
cd /home/vagrant/.janus

# janus
curl -L https://bit.ly/janus-bootstrap | bash

# L9 + Fuzzy Finder
mkdir /home/vagrant/.janus/plugins/l9
cd /home/vagrant/.janus/plugins/l9
wget "https://github.com/dkoloditch/dotfiles/blob/master/vim-l9.zip?raw=true"
mv vim-l9.zip\?raw\=true vim-l9.zip
unzip vim-l9.zip
cd /home/vagrant/.janus/plugins/
git clone git@github.com:vim-scripts/FuzzyFinder.git

# color schemes
mkdir /home/vagrant/.vim/colors
cd /home/vagrant/.vim/colors
wget "https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim"

# Vim-Tags (like Ctags)
sudo yum install -y ctags
cd /home/vagrant/vagrant_share
ctags -R --exclude=temp --exclude=vendor --exclude=public

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
map DD :tabprev<CR>
map FF :tabnext<CR>

" Redo
nmap r :redo<Enter>

" Normal mode
imap <leader>j<space> <Esc>

 " Character limit line
set colorcolumn=80

" Turn off search highlighting
" map <leader>oo :noh
' > /home/vagrant/.vimrc.after
