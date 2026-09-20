local check = {}

--- Like |vim.validate|, but populates errs (mutating it) if the validation fails.
---@param errs      string[]               Errors
---@param name      string                 Argument name
---@param value     unknown                Argument value
---@param validator vim.validate.Validator
---@param optional? boolean                Argument is optional (may be omitted)
---@param message?  string                 message when validation fails
---@see vim.validate
local function validate(errs, name, value, validator, optional, message)
    local ok, err = pcall(vim.validate, name, value, validator, optional, message)
    if not ok then
        table.insert(errs, err)
    end
end

--- Validates the config.
---@param cfg LuxConfig
---@return boolean is_valid
---@return string | never error_message
function check.validate(cfg)
    local errs = {}
    validate(errs, "lux_nvim.lazy", cfg.lazy, "boolean")
    validate(errs, "lux_nvim.dynamic_rtp", cfg.dynamic_rtp, "boolean")
    validate(errs, "lux_nvim.generate_help_pages", cfg.generate_help_pages, "boolean")
    local ok = #errs > 0
    ---@type string | never
    local error_message
    if not ok then
        error_message = ([[lux: Invalid config.
%s
]])
            ---@diagnostic disable-next-line: call-non-callable
            :format(vim.iter(errs):join("\n"))
    end
    return ok, error_message
end

--- Recursively check a table for unrecognized keys,
--- using a default table as a reference
---@param tbl         table
---@param default_tbl table
---@return string[]
function check.get_unrecognized_keys(tbl, default_tbl)
    local unrecognized_keys = {}
    for k, _ in pairs(tbl) do
        unrecognized_keys[k] = true
    end
    for k, _ in pairs(default_tbl) do
        unrecognized_keys[k] = false
    end
    local ret = {}
    for k, _ in pairs(unrecognized_keys) do
        if unrecognized_keys[k] then
            ret[k] = k
        end
        if type(default_tbl[k]) == "table" and tbl[k] then
            for _, subk in pairs(check.get_unrecognized_keys(tbl[k], default_tbl[k])) do
                local key = k .. "." .. subk
                ret[key] = key
            end
        end
    end
    return vim.tbl_keys(ret)
end

return check
