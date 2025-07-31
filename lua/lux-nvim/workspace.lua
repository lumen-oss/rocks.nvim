local workspace = {}

local log = require("lux-nvim.log")
local lux = require("lux-nvim.lux-lua-shim")
local pathlib = require("pathlib")
local Result = require("fallo")

---@readonly
workspace.PROJECT_PATH = pathlib.stdpath("config")

---@return Result<any, string>
function workspace.new()
    local ws = lux.workspace.new(workspace.PROJECT_PATH:tostring())

    if not ws then
        local err = string.format("unable to create Lux project at %s", workspace.PROJECT_PATH:tostring())
        log:fatal(err)
        return Result.err(err)
    end

    return Result.ok(ws)
end

return workspace
