" Function made to dorp package and rerun everytime lua file changes
fun! CheatSheetNvim()

    lua for k in pairs(package.loaded) do if k:match("^cheat%-sh%-nvim") then package.loaded[k] = nil end end
    lua require("cheat-sh-nvim").cheatSheet()
endfun

augroup CheatSheetNvim
    autocmd!
    autocmd vimResized * :lua require("cheat-sh-nvim").onResize()
augroup END
