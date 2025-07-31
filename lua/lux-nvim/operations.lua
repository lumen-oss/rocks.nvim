local operations = {}

function operations.edit()
    local project = require("lux-nvim.workspace")
        .new()
        :unwrap()
    error("workspaces are unsupported rn")
    -- vim.cmd.edit(project:toml_path())
end

return operations
