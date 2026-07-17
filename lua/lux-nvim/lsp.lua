local lsp = {}

local pathlib = require("pathlib")
local port_path = pathlib.stdpath("config") / ".lux" / "lsp-port"

function lsp.configure_lsp()
    vim.lsp.config("lx-lsp", {
        cmd = { vim.fn.stdpath("config") .. "/.lux/5.1/bin/lx-lsp" },
        root_dir = function(_, on_dir)
            on_dir(vim.fn.stdpath("config"))
        end,
    })

    vim.lsp.enable("lx-lsp")
end

function lsp.configure_progress()
    local ws = require("lux-nvim.workspace").new():unwrap()

    port_path:register_watcher("lux_connect_to_lsp", function()
        require("lux-nvim.lux-lua-shim").progress.set_connection(ws)

        port_path:unregister_watcher("lux_connect_to_lsp")
    end)
end

return lsp
