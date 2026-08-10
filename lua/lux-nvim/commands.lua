local cmd = require("mega.cmdparse")
local config = require("lux-nvim.config.lux-config")
local coro = require("lux-nvim.coroutine")
local lux = require("lux-nvim.lux-lua-shim")
local paths = require("lua.lux-nvim.paths")
local workspace = require("lux-nvim.workspace")

local commands = {}

---@param subparser mega.cmdparse.Subparsers
---@param parser_data mega.cmdparse.ParameterParserInputOptions
---@param parameter_data mega.cmdparse.ParameterInputOptions
---@param fn fun(data: any)
local function set_up_package_command(subparser, parser_data, parameter_data, fn)
    local parser = subparser:add_parser(parser_data)
    parser:add_parameter(parameter_data)
    parser:set_execute(fn)
end

---@param subparser mega.cmdparse.Subparsers
local function set_up_sync_command(subparser)
    local parser = subparser:add_parser({
        name = "sync",
        help = "Syncs the `lux.toml` state with the filesystem"
    })
    parser:set_execute(function(_data)
        local ws = workspace.get():unwrap()
        local cfg = config.default()
        coro.execute(function()
            local report = lux.operations.sync(ws, cfg)
            local regular_dependencies_added = report[1].added

            paths.add_to_package_path(regular_dependencies_added, ws, cfg)
        end)
    end)
end

---@param subparser mega.cmdparse.Subparsers
local function set_up_log_command(subparser)
    local parser = subparser:add_parser({
        name = "log",
        help = "Shows the `lux.nvim` logfile for debugging"
    })
    parser:set_execute(require("lux-nvim.operations").open_logfile)
end

---@param subparser mega.cmdparse.Subparsers
local function set_up_edit_command(subparser)
    local parser = subparser:add_parser({
        name = "edit",
        help =
        "Edit the `lux.toml`"
    })
    parser:set_execute(require("lux-nvim.operations").edit)
end

--- Creates the `:Lux` command
function commands.create_commands()
    local parser = cmd.ParameterParser.new({
        name = "Lux",
        help = "A luxurious package manager for Neovim"
    })
    local subparser = parser:add_subparsers({ name = "commands" })

    set_up_package_command(subparser, {
        name = "update",
        help = "Updates all the plugins in `lux.toml`"
    }, {
        name = "packages",
        help = "Packages to update",
        nargs = "+",
        required = false,
    }, function(data)
        local ws = workspace.get():unwrap()
        local cfg = config.default()

        coro.execute(function()
            lux.operations.update(ws, data.namespace.packages, cfg)
        end)
    end)

    set_up_package_command(subparser, {
        name = "add",
        help =
        "Installs a set of packages and adds them to `lux.toml`"
    }, {
        name = "packages",
        help = "Packages to install (`package_name` or `package_name@version`)",
        nargs = "+",
    }, function(data)
        local ws = workspace.get():unwrap()
        local cfg = config.default()

        coro.execute(function()
            local added = lux.operations.add(ws, { regular = data.namespace.packages }, cfg)
            paths.add_to_package_path(added, ws, cfg)
        end)
    end)

    set_up_package_command(subparser, {
        name = "remove",
        help = "Removes a set of packages from the `lux.toml`"
    }, {
        name = "packages",
        help = "Packages to remove (`package_name`)",
        nargs = "+",
    }, function(data)
        local ws = workspace.get():unwrap()
        local cfg = config.default()

        coro.execute(function()
            lux.operations.remove(ws, { regular = data.namespace.packages }, cfg)
        end)
    end)

    set_up_package_command(subparser, {
        name = "pin",
        help = "Pins a package so that it never gets updated",
    }, {
        name = "packages",
        help = "Packages to pin (`package_name`)",
        nargs = "+",
    }, function() end)

    set_up_package_command(subparser, {
        name = "unpin",
        help = "Unpins a package so that it can receive updates again",
    }, {
        name = "packages",
        help = "Packages to unpin (`package_name`)",
        nargs = "+",
    }, function() end)

    set_up_edit_command(subparser)
    set_up_sync_command(subparser)
    set_up_log_command(subparser)

    cmd.create_user_command(parser)
end

return commands
