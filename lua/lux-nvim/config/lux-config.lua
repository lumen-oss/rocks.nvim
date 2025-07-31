local lux_config = {}
local lux = require("lux-nvim.lux-lua-shim")

local default_config = lux.config.new()
    :lua_version("5.1")
    :entrypoint_layout({ layout = "nvim" })
    :build()

lux.logging.set_enabled(true)

-- TODO(vhyrro): this should read from the lua configuration and adapt the config accordingly
function lux_config.default()
    return default_config
end

return lux_config
