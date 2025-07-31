if vim.g.loaded_lux_nvim then
    return
end

local min_version = "0.11.0"
if vim.fn.has("nvim-" .. min_version) ~= 1 then
    vim.notify_once(("rocks.nvim requires Neovim >= %s"):format(min_version), vim.log.levels.ERROR)
    return
end

require("lux-nvim.commands").create_commands()

-- Activate the Lux loader for proper dependency lookups
require("lux").loader()

vim.g.loaded_lux_nvim = true
