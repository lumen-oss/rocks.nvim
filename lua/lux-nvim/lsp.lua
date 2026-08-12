local lsp = {}

local pathlib = require("pathlib") ---@as PathlibPath

local port_path = pathlib.stdpath("run") / "lux-lsp-port"

function lsp.configure_lsp()
    -- vim.lsp.config("lx-lsp", {
    --     cmd = { vim.fn.stdpath("config") .. "/.lux/5.1/bin/lx-lsp" },
    --     -- cmd = { vim.fn.stdpath("data") .. "/site/pack/lux/" },
    --     root_dir = function(_, on_dir)
    --         on_dir(vim.fn.stdpath("config"))
    --     end,
    --     cmd_env = {
    --         LUX_LSP_PORT_FILE = port_path:tostring(),
    --     }
    -- })
    --
    -- vim.lsp.enable("lx-lsp")
end

function lsp.configure_progress()
    vim.env.LUX_LSP_PORT_FILE = port_path:tostring()

    local ws = require("lux-nvim.workspace").get():unwrap()

    port_path:register_watcher("lux_connect_to_lsp", function()
        require("lux-nvim.lux-lua-shim").progress.set_connection(ws)

        port_path:unregister_watcher("lux_connect_to_lsp")
    end)
end

return lsp
