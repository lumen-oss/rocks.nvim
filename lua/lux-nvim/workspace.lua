local workspace = {}

local lux = require("lux-nvim.lux-lua-shim")

---@readonly
workspace.PROJECT_PATH = vim.fn.stdpath("config") --[[@as string]]

---@return Result<Workspace, string>
function workspace.get()
    -- IMPORTANT: this is placed within workspace.get() because during bootstrapping
    -- (before all dependencies are available) `lux.nvim` has no way of accessing libraries,
    -- however we need to be able to do `require("lux-nvim.workspace")` in order to properly
    -- configure package.path.
    local log = require("lux-nvim.log")
    local Result = require("fallo")

    local ws = lux.workspace.new(workspace.PROJECT_PATH)

    if not ws then
        local err = string.format("unable to create Lux project at %s", workspace.PROJECT_PATH)
        log:fatal(err)
        return Result.err(err)
    end

    ---@cast Result.ok function (it is boolean|function)
    return Result.ok(ws)
end

function workspace.get_unchecked()
    local ws = lux.workspace.new(workspace.PROJECT_PATH)

    if not ws then
        return
    end

    return ws
end

return workspace
