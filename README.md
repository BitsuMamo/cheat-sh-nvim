# A simple plugin that gets information from [Cheat Sheet](http://cht.sh)
### Opens a floating window with terminal. It get cheat sheet with the file type of the current buffer and the word under the cursor. It can also propmt you an input and get cht.sh info based on the input.

# Usage
## Create a key binding that call the lua function
## Example
### `nnoremap <leader>cc :lua require('cheat-sh-nvim').cheatSheet()<CR>`
### `nnoremap <leader>cs :lua require('cheat-sh-nvim').cheatSheetCommand(vim.fn.input("Cheat Sheat> "))<CR>'`

### After setting up the first key binding you can call it anywhere it will get the current buffer file type, and the current word under cursor then do a quick cheat.sh look up.
### After settign up the second key binding you can call it and it will ask for a propmt where you can input and get cht.sh data.


### This project was inspired by [ThePrimeagen's](https://www.youtube.com/c/ThePrimeagen) "[Writing Neovim Plugins](https://www.youtube.com/watch?v=9L4sW047oow)" seires. If it weren't for that it wouldn't have been created.
### The border ASCI code was taken from [Telescope](https://github.com/nvim-telescope/telescope.nvim) repository.
