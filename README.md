# cheat-sh-nvim

A simple plugin for getting information from [Cheat Sheet](http://cht.sh)

## What is cheat-sh-nvim?

It is a plugin which allows you to get [cht.sh](http://cht.sh) functionality right with in neovim.
It currently supports two types of functionality which are cheat sheet with command and cheat sheet for current word.
The new floating windows follow the same theme as the one you have set.

### Command Mode Preview
![Preview](https://i.imgur.com/mHavPZi.png)
![Preview](https://i.imgur.com/kHXZzCJ.png)

### Under Cursor Mode Preview
![Preview](https://i.imgur.com/ytA1Aig.png)

## Getting Started

### Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'BitsuMamo/cheat-sh-nvim'
```

### Usage

```viml
" Use Cheat Sheat using command line
nnoremap <leader>cs :call CheatSheetCommand()<CR>
nnoremap <leader>cc :call CheatSheetCursor()<CR>

" Using Lua functions
nnoremap <leader>cs :lua require('cheat-sh-nvim').cheatSheet()<CR>
nnoremap <leader>cc :lua require('cheat-sh-nvim').cheatSheetCommand(vim.fn.input("Cheat Sheet> "))<CR>
```

## Project Inspiration

This project was inspired by [ThePrimeagen's](https://www.youtube.com/c/ThePrimeagen) "[Writing Neovim Plugins](https://www.youtube.com/watch?v=9L4sW047oow)" seires. If it weren't for that it wouldn't have been created.
The border ASCI code was taken from [Telescope](https://github.com/nvim-telescope/telescope.nvim) repository.
