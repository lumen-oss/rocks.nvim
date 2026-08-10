-- Helpers for creating coroutines that execute Lux tasks.
-- `nvim-nio` expects a special table structure returned by `yield()`, which we cannot provide from the Rust side.
-- For this reason, we create our own basic async wrapper here.

local coro = {}

local log = require("lux-nvim.log")

---@param func fun()
function coro.execute(func)
    local co = coroutine.create(function()
        return func()
    end)
    local function step()
        local ok, result = coroutine.resume(co)
        if not ok then
            local res = tostring(result)
            log:fatal(res)
            error(res)
        end
        if coroutine.status(co) ~= "dead" then
            vim.schedule(step)
        end
    end
    step()
end

return coro
