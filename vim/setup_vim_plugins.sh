#!/usr/bin/env sh
# Run this from within the .vim folder
mkdir -p ./pack/plugins/start

ORIGIN_DIR="`pwd`"
PLUGIN_DIR="`pwd`/pack/plugins/start"
cd $PLUGIN_DIR

git clone https://github.com/rust-lang/rust.vim

git clone https://github.com/fatih/vim-go.git
# git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/StanAngeloff/php.vim.git
git clone https://github.com/guileen/vim-node.git
git clone https://github.com/myhere/vim-nodejs-complete.git
git clone https://github.com/vim-ruby/vim-ruby.git
git clone https://github.com/guileen/vim-node-dict.git
git clone https://github.com/goatslacker/mango.vim.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/valloric/MatchTagAlways.git
git clone https://github.com/nanotech/jellybeans.vim.git
git clone https://github.com/jaromero/vim-monokai-refined.git
git clone https://github.com/w0ng/vim-hybrid.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/ap/vim-buftabline.git
git clone https://github.com/rsense/rsense
git clone https://github.com/vim-scripts/Lucius
git clone https://github.com/bling/vim-airline
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/maksimr/vim-jsbeautify
git clone https://github.com/einars/js-beautify
git clone https://github.com/elzr/vim-json
git clone https://github.com/kchmck/vim-coffee-script
git clone https://github.com/pangloss/vim-javascript
git clone https://github.com/othree/html5.vim
git clone https://github.com/tpope/vim-git
git clone https://github.com/tpope/vim-haml
git clone https://github.com/shawncplus/phpcomplete.vim
git clone https://github.com/ciaranm/inkpot
git clone https://github.com/wellle/tmux-complete.vim
git clone https://github.com/rstacruz/sparkup
git clone https://github.com/flazz/vim-colorschemes
#git clone https://github.com/SirVer/ultisnips
git clone https://github.com/Yggdroot/indentLine
git clone https://github.com/honza/vim-snippets
git clone https://github.com/rust-lang/rust.vim
git clone https://github.com/racer-rust/vim-racer

cd $ORIGIN_DIR
