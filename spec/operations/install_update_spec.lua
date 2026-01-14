local tempdir = vim.fn.tempname()
vim.g.rocks_nvim = {
    luarocks_binary = "luarocks",
    rocks_path = tempdir,
    config_path = vim.fs.joinpath(tempdir, "rocks.toml"),
}
local nio = require("nio")
vim.env.PLENARY_TEST_TIMEOUT = 1000 * 60
describe("install/update #online", function()
    local operations = require("rocks.operations")
    local state = require("rocks.state")

    setup(function()
        vim.system({ "rm", "-r", tempdir }):wait()
        vim.system({ "mkdir", "-p", tempdir }):wait()
    end)

    nio.tests.it("install and update rocks", function()
        local pkg_name = "nlua"
        local autocmd_future = nio.control.future()
        vim.api.nvim_create_autocmd("User", {
            pattern = "RocksInstallPost",
            callback = function(ev)
                if not autocmd_future.is_set() then
                    autocmd_future.set(ev.data)
                end
            end,
        })
        local future = nio.control.future()
        operations.add({ "nlua", "0.1.0" }, {
            callback = function() -- ensure lower case
                future.set(true)
            end,
        })
        future.wait()
        local pkg_expected = {
            name = "nlua",
            version = "0.1.0",
        }
        local installed_rocks = state.installed_rocks()
        assert.same(pkg_expected, installed_rocks[pkg_name])
        local data = autocmd_future.wait()
        assert.same(pkg_expected, data.installed)
        assert.same(pkg_expected, data.spec)
        local user_rocks = require("rocks.config.internal").get_user_rocks()
        assert.same({
            name = "nlua",
            version = "0.1.0",
        }, user_rocks[pkg_name])
        future = nio.control.future()
        operations.update(function()
            future.set(true)
        end, {
            skip_prompts = true,
        })
        future.wait()
        installed_rocks = state.installed_rocks()
        local updated_version = vim.version.parse(installed_rocks[pkg_name].version)
        assert.True(updated_version > vim.version.parse("0.1.0"))
        user_rocks = require("rocks.config.internal").get_user_rocks()
        assert.True(vim.version.parse(user_rocks[pkg_name].version) > vim.version.parse("0.1.0"))
    end)
end)
