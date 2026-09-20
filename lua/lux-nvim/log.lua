local log = require("mega.logging")

local logger = log.Logger.new({
    name = "lux.nvim",
    use_file = true,
    use_neovim_commands = true,
    use_console = true
})

return logger
