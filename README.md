# A simple plugin that gets information from Cheat Sheet(cht.sh)
## Opens a floating window with terminal. It get cheat sheet with the file type of the current buffer and the word under the cursor

# Usage
## Create a key binding that call the lua function
## Example  `nnoremap <leader>cs :lua require('cheat-sh-nvim').cheatSheet()<CR>`
## After setting up the key binding you can call it anywhere it will get the current buffer file type, and the current word under cursor then do a quick cheat.sh look up.


## This project was inspired by ThePrimeagen's "Writing Neovim Plugins" seires. If it weren't for that it wouldn't have been created.
## The border ASCI code was taken from [Telescope](https://github.com/nvim-telescope/telescope.nvim) repository.
