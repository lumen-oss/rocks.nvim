local lux_config = {}

local lux = require("lux-nvim.lux-lua-shim")

local default_config = lux.config.new()
    :lua_version("5.1")
    :entrypoint_layout({ layout = "nvim" })
    :extra_servers({ "https://lux.lumen-labs.org/rocks-binaries/" })
    :workspace_tree(vim.fn.stdpath("data") .. "/lux")
    :build()

-- TODO(vhyrro): this should read from the lua configuration and adapt the config accordingly
function lux_config.default()
    return default_config
end

return lux_config
