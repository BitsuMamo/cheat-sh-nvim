--TODO: Add closing of window when buffer is changed
--TODO: Added global fucntionality but can't chage values from init.vim
--TODO: Add fucntionality of searching cht.sh from selected text

-- Global Variables
local stats
local width
local height

-- Function to open the termial with cht.sh and a command
local function openTerminal(command)
    local command_string = "terminal curl cht.sh/"..command

    vim.api.nvim_command(command_string)
end

-- Function to create window
local function createWindow(bufHandler, width, height, widthRatio, heightRatio, row, col, windowType, anchor)
    -- To avoid errors with negative width and height
    width = math.abs(math.floor(width * widthRatio))
    height = math.abs(math.floor(height * heightRatio))
    local win_opts = {
        relative = windowType,
        width = width,
        height = height,
        row = row,
        col = col,

        border = {"╭", "─", "╮" ,"│", "╯", "─","╰", "│"},
        anchor = anchor
    }

    return vim.api.nvim_open_win(bufHandler, true, win_opts)
end

-- Function to and open window
local function openWindow(isCommand)
    -- Gets the status of the whole window and not just the buffer
    stats = vim.api.nvim_list_uis()[1]
    -- Getting width and heigt for the status table
    width = stats.width
    height = stats.height

    -- create buffer for window
    local bufferHandler = vim.api.nvim_create_buf(false, true)
    local anchor = nil
    local widthRatio, heightRatio, CursorColOffset, CursorRowOffset, windowType

    if isCommand then
        widthRatio = vim.g["CommandWidthRatio"]
        heightRatio = vim.g["CommandHeightRatio"]
        CursorRowOffset = 5
        CursorColOffset = 5
        windowType = "editor"
    else
        widthRatio = vim.g["CursorWidthRatio"]
        heightRatio = vim.g["CursorHeightRatio"]
        CursorRowOffset = math.abs(vim.g["CursorRowOffset"])
        CursorColOffset = math.abs(vim.g["CursorColOffset"])
        windowType = "cursor"
    end

    local window = createWindow(bufferHandler, width, height, widthRatio, heightRatio, CursorRowOffset, CursorColOffset, windowType, anchor)

    -- Makes new windows follow same theme as the editor
    vim.api.nvim_win_set_option(window, 'winhl', 'Normal:Myhighlight')

end

-- Fucntion to open a window with all the cht.sh info for the word under the cursor
local function cheatSheetCursor()

    local fileType = vim.bo.filetype
    local wordUnderCursor = vim.fn.expand("<cword>")

    local command = fileType.."/"..wordUnderCursor
    print(command)
    openWindow(false)
    openTerminal(command)

end

-- String split function. By default splits " "
local function splitString(input, separator)
    if separator == nil then
        separator = "%s"
    end

    local wordList = {}
    for str in string.gmatch(input, "([^"..separator.."]+)") do
        table.insert(wordList,str)
    end

    return wordList
end

-- Function to open window with cheat sheet but search for a specific pharse
local function cheatSheetCommand(input)
    if input ~= nil then
        local wordList = splitString(input, " ")

        -- The first word is the language of choice
        local language = wordList[1]

        local searchPharse = ""
        local numberOfWords = table.getn(wordList)
        local counter = 2;
        -- Creates the search pharse with the + concatenation for cht.sh
        while counter <= numberOfWords do
            if counter ~= numberOfWords then
                searchPharse = searchPharse..wordList[counter].."+"
            else
                searchPharse = searchPharse..wordList[counter]
            end
            counter = counter + 1
        end

        local command = language.."/"..searchPharse

        openWindow(true)
        openTerminal(command)
    else
        print("Error. No input or Wrong input")
    end
end

-- Function to dynamically resize window when referance window is resized
local function onResize()
    stats = vim.api.nvim_list_uis()[1]
    width = stats.width
    height = stats.height
end

-- Used to make functions that are only needed accesible
return {
    cheatSheetCursor = cheatSheetCursor,
    cheatSheetCommand = cheatSheetCommand,
    onResize = onResize,
}
