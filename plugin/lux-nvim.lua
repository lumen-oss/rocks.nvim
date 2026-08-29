if vim.g.loaded_lux_nvim then
    return
end

require("lux-nvim.paths").bootstrap_lux_lua()
require("lux-nvim.paths").configure_package_path()

local log = require("lux-nvim.log")

local min_version = "0.12.0"
if vim.fn.has("nvim-" .. min_version) ~= 1 then
    vim.notify_once(("lux.nvim requires Neovim >= %s"):format(min_version), vim.log.levels.ERROR)
    return
end

local pathlib = require("pathlib") ---@as PathlibPath

local toml_path = pathlib.stdpath("config") / "lux.toml"

if not toml_path:exists() then
    log:info("project file not created yet. Attempting to create with defaults...")

    local write_result = toml_path:io_write([[
package = "neovim-config"
version = "1.0.0"
lua = "5.1"

[description]
labels = [ "neovim" ]

[dependencies]

[run]
command = "nvim"

[build]
type = "builtin"
    ]])

    if not write_result then
        local msg = string.format(
            "unable to create default project file at %s! does the directory exist and do you have the correct permissions?",
            toml_path:tostring()
        )

        log:fatal(msg)
        error(msg)
    end
end

require("lux-nvim.paths").ensure_symlink()

-- Activate the Lux loader for proper dependency lookups
-- TODO(vhyrro): I don't think loading the loader once is enough for some weird edge cases?
-- Consider tracing how this loader behaves in different environments.
require("lux-nvim.lux-lua-shim"):loader()

require("lux-nvim.lsp").configure_lsp()
require("lux-nvim.lsp").configure_progress()

require("lux-nvim.commands").create_commands()

vim.g.loaded_lux_nvim = true
