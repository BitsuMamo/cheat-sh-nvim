--TODO: Add closing of window when buffer is changed
--TODO: Add fucntionality of changing some variable such as window height and the like
--TODO: Add fucntionality of searching cht.sh from selected text

-- Function to open the termial with a command
local function openTerminal(command)
    local command_string = "terminal "..command

    local terimal = vim.api.nvim_command(command_string)
    return terimal
end

-- Function to create window
local function createWindow(bufHandler, width, height, widthOffset, heightOffset, row, col, type)
    local window = vim.api.nvim_open_win(bufHandler, true ,{
        relative=type,
        width=width - widthOffset,
        height=height - heightOffset,
        row = row,
        col = col,

        border = {"╭", "─", "╮" ,"│", "╯", "─","╰", "│"}
    })
end

-- Function to and open window
local function openWindow(isCommand)
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width
    local height = stats.height

    -- create buffer for window
    local bufHandler = vim.api.nvim_create_buf(false, true)

    if isCommand then
        createWindow(bufHandler, width, height, 10, 10, 5, 5, "editor")
    else
        createWindow(bufHandler, width, height, 40, 40, 0, 2, "cursor")
    end


    -- Makes new windows follow same theme as the editor
    local windowOption = vim.api.nvim_win_set_option(window, 'winhl', 'Normal:Myhighlight')
end

-- Fucntion to open a window with all the cht.sh info for the word under the cursor
local function cheatSheetCursor()
    local fileType = vim.bo.filetype
    local wordUnderCursor = vim.fn.expand("<cword>")

    local command = "curl cht.sh/"..fileType.."/"..wordUnderCursor
    print(command)
    local window = openWindow(false)
    local terminal = openTerminal(command)
end

-- String split function. By default splits " "
local function splitString(input, separator)
    if separator == nil then
        sep = "%s"
    end

    local list = {}
    for str in string.gmatch(input, "([^"..separator.."]+)") do
        table.insert(list,str)
    end

    return list
end

-- Function to open window with cheat sheet but search for a specific pharse
local function cheatSheetCommand(input)
    if input ~= nil then
        local list = splitString(input, " ")

        -- The first word is the language of choice
        local language = list[1]

        local searchPharse = ""
        local numberOfWords = table.getn(list)
        local counter = 2;
        -- Creates the search pharse with the + concatenation for cht.sh
        while counter <= numberOfWords do
            if counter ~= numberOfWords then
                searchPharse = searchPharse..list[counter].."+"
            else
                searchPharse = searchPharse..list[counter]
            end
            counter = counter + 1
        end

        local command = "curl cht.sh/"..language.."/"..searchPharse

        local window = openWindow(true)
        local termial = openTerminal(command)
    else
        print("Error. No input or Wrong input")
    end
end

-- Function to dynamically resize window when referance window is resized
local function onResize()
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width
    local height = stats.height
end

-- Used to make functions that are only needed accesible
return {
    cheatSheetCursor = cheatSheetCursor,
    cheatSheetCommand = cheatSheetCommand,
    onResize = onResize,
}

