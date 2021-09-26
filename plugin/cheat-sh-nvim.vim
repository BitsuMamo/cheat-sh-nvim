" Function made to dorp package and rerun everytime lua file changes
fun! CheatSheetCursor()

    lua for k in pairs(package.loaded) do if k:match("^cheat%-sh%-nvim") then package.loaded[k] = nil end end
    lua require("cheat-sh-nvim").cheatSheetCursor()
endfun

fun! CheatSheetCommand()
    lua for k in pairs(package.loaded) do if k:match("^cheat%-sh%-nvim") then package.loaded[k] = nil end end
    lua require("cheat-sh-nvim").cheatSheetCommand(vim.fn.input("Cheat Sheat> "))
endfun

let g:CommandWidthOffset = 10
let g:CommandHeightOffset = 10

let g:CursorWidthOffset = 70
let g:CursorHeightOffset = 40

let g:CursorRowOffset = 0
let g:CursorColOffset = 2

augroup CheatSheetCursor
    autocmd!
    autocmd vimResized * :lua require("cheat-sh-nvim").onResize()
augroup END

augroup CheatSheetCommand
    autocmd!
    autocmd vimResized * :lua require("cheat-sh-nvim").onResize()
augroup END
