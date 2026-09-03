-- `nvim --headless --clean -u NONE -l scripts/generate_api_docs.lua`

local project = vim.fn.getcwd()

-- Put the project root on the runtimepath so mega.vimdoc can resolve the
-- `lua/` namespace of each source file, then add every `.lux` build
-- dependency so we get access to mega.vimdoc itself
vim.opt.runtimepath:append(project)

for _, dir in ipairs(vim.fn.glob(project .. "/.lux/5.1/build_dependencies/5.1/*/src", false, true)) do
    vim.opt.runtimepath:append(dir)
    package.path = dir .. "/?.lua;" .. dir .. "/?/init.lua;" .. package.path
end

local mega = require("mega.vimdoc")

local entries = {}
for _, source in ipairs(vim.fn.glob(project .. "/lua/lux-nvim/**/*.lua", false, true)) do
    local f = assert(io.open(source, "r"))
    local content = f:read("*a")
    f:close()

    if content:find("---@", 1, true) then
        local rel = source:sub(#project + 2)
        local name = rel:gsub("^lua[/\\]lux%-nvim[/\\]", ""):gsub("[/\\]", "-"):gsub("%.lua$", "")

        entries[#entries + 1] = {
            source = source,
            destination = project .. "/doc/lux-api-" .. name .. ".txt",
        }
    end
end

vim.fn.mkdir(project .. "/doc", "p")
mega.make_documentation_files(entries)

vim.cmd("qa!")
