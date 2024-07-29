#!/usr/bin/env bash

ln -sfv "$HOME/.config/nvim" "$(dirname "$0")"

brew install task
brew install gcc-14
brew install vit
brew install tasksh
brew install luarocks
brew install luajit
brew install neovim
brew install python3
brew install tmux
brew install ripgrep
brew install fd
brew install httpie
brew install jq
brew install pgcli
brew install sox

luarocks install --lua-version 5.1 tiktoken_core # for copilotchat
go install github.com/a-h/templ/cmd/templ@latest
