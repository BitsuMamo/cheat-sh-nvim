--TODO: Add closing of window when buffer is changed
--TODO: Add fucntionality of changing some variable such as window height and the like
--TODO: Add fucntionality of searching cht.sh from selected text

-- Function to open the termial with a command
local function openTerminal(command)
    local command_string = "terminal "..command

    local terimal = vim.api.nvim_command(command_string)
    return terimal
end

-- Function to create and open window
local function openWindow()
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width
    local height = stats.height


    local bufHandler = vim.api.nvim_create_buf(false, true)
    local window = vim.api.nvim_open_win(bufHandler, true ,{
        relative="cursor",
        width=width - 40,
        height=height - 40,
        row = 0,
        col = 2,

        border = {"╭", "─", "╮" ,"│", "╯", "─","╰", "│"}
    })

    -- Makes new windows follow same theme as the editor
    local windowOption = vim.api.nvim_win_set_option(window, 'winhl', 'Normal:Myhighlight')
end

-- Fucntion to open a window with all the cht.sh info for the word under the cursor
local function cheatSheet()
    local fileType = vim.bo.filetype
    local wordUnderCursor = vim.fn.expand("<cword>")

    local command = "curl cht.sh/"..fileType.."/"..wordUnderCursor
    print(command)
    local window = openWindow()
    local terminal = openTerminal(command)
end

-- Function to dynamically resize window when referance window is resized
local function onResize()
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width
    local height = stats.height
end

-- Used to make functions that are only needed accesible
return {
    cheatSheet = cheatSheet,
    onResize = onResize,
}

