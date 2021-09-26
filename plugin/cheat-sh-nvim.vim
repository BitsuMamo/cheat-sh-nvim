" Function made to dorp package and rerun everytime lua file changes
fun! CheatSheetCursor()

    lua for k in pairs(package.loaded) do if k:match("^cheat%-sh%-nvim") then package.loaded[k] = nil end end
    lua require("cheat-sh-nvim").cheatSheetCursor()
endfun

fun! CheatSheetCommand()
    lua for k in pairs(package.loaded) do if k:match("^cheat%-sh%-nvim") then package.loaded[k] = nil end end
    lua require("cheat-sh-nvim").cheatSheetCommand(vim.fn.input("Cheat Sheat> "))
endfun

augroup CheatSheetCursor
    autocmd!
    autocmd vimResized * :lua require("cheat-sh-nvim").onResize()
augroup END

augroup CheatSheetCommand
    autocmd!
    autocmd vimResized * :lua require("cheat-sh-nvim").onResize()
augroup END
