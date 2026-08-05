local operations = {}

local log = require("lux-nvim.log")

function operations.edit()
    local workspace = require("lux-nvim.workspace")
        .get()
        :unwrap()

    -- TODO: pathlib
    vim.cmd.edit(workspace:root() .. "/lux.toml")
end

function operations.open_logfile()
    vim.cmd.edit(log:get_log_path())
end

return operations
