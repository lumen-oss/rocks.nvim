local platform = {}

function platform.detect_library_extension()
    local uname = vim.uv.os_uname()
    local sysname = uname.sysname:lower()

    if sysname == "linux" then
        return ".so"
    elseif sysname == "darwin" then
        return ".so"
    elseif sysname:match("windows") then
        return ".dll"
    end

    error(
        "luxstrap: unable to detect current operating system! Please report this at https://github.com/lumen-oss/luxstrap.nvim/issues/new with your operating system, version and architecture."
    )
end

return platform
