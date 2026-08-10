-- Module for setting up the package path and symlinking the site/ path.

local paths = {}

local workspace = require("lux-nvim.workspace")
local config = require("lux-nvim.config.lux-config")

function paths.configure_package_path()
    local cfg = config.default()
    local ws = workspace.get():unwrap()
    local lockfile = ws:tree(cfg):lockfile()

    -- ISSUE: this will get absolutely all rocks, but we should only be getting
    -- entrypoints. transitive dependencies should not be in the package path and the lux
    -- loader should be the one intercepting the require calls.
    paths.add_to_package_path(vim.tbl_values(lockfile:rocks()), ws, cfg)
end

---@param pkgs LocalPackage[]
---@param ws unknown
---@param cfg Config
function paths.add_to_package_path(pkgs, ws, cfg)
    ---@type Tree
    local tree = ws:tree(cfg)

    local package_path_extension = vim.iter(pkgs):map(
        ---@param pkg LocalPackage
            function(pkg)
                local root = tree:root_for(pkg)

                return string.format("%s/src/?.lua;%s/src/?/init.lua", root, root)
            end)
        :join(";")

    package.path = package.path .. ";" .. package_path_extension
end

--- Ensures that the symlink between the site/pack/lux directory from the tree and the
--- actual Neovim site is maintained properly.
function paths.ensure_symlink()
    local pathlib = require("pathlib")
    local log = require("lux-nvim.log")

    local cfg = config.default()
    local ws = workspace.get():unwrap()
    ---@type Tree
    local tree = ws:tree(cfg)

    local target = pathlib.stdpath("data") / "site/pack/lux"

    if target:exists(true) then
        return
    end

    local path = pathlib.new(tree:root()) / "site/pack/lux"

    if not path:symlink_to(target) then
        -- TODO: better error handling (return Result?)
        log:fatal(
            "Unable to create a symlink from the Lux store to Neovim. This is a bug, please report it to the lux.nvim developers.")
        error()
    end
end

return paths
