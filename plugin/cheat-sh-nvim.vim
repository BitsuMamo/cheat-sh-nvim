" Function made to dorp package and rerun everytime lua file changes
fun! CheatSheatNvim()

    lua for k in pairs(package.loaded) do if k:match("^cheat%-sheat%-nvim") then package.loaded[k] = nil end end
    lua require("cheat-sh-nvim").cheatSheat()
endfun

augroup CheatSheatNvim
    autocmd!
    autocmd vimResized * :lua require("cheat-sh-nvim").onResize()
augroup END
