--------------------------------------------------------------------------------
-- System theme colors
--------------------------------------------------------------------------------

local theme_lua_path = os.getenv('XDG_CACHE_HOME') .. '/theme/theme.lua'

local PathUtils = require('utils.path')
PathUtils.prepend_to_package_path(theme_lua_path)

local theme_dict = require('theme')
assert(theme_dict ~= nil, 'Could not load `' .. theme_lua_path .. '`.')


local SystemTheme = {}

function SystemTheme.color_hash(name)
    local result = theme_dict.colors[name]

    if result == nil then
        error('Color `' .. name .. '` not found.', 2)
    end

    return '#' .. result
end

local ansi_index_lookup = {
    ['black']     = 0,
    ['red']       = 1,
    ['green']     = 2,
    ['yellow']    = 3,
    ['blue']      = 4,
    ['magenta']   = 5,
    ['cyan']      = 6,
    ['white']     = 7,
    ['brblack']   = 8,
    ['brred']     = 9,
    ['brgreen']   = 10,
    ['bryellow']  = 11,
    ['brblue']    = 12,
    ['brmagenta'] = 13,
    ['brcyan']    = 14,
    ['brwhite']   = 15
}

function SystemTheme.color_ansi_index(name)
    if name:sub(1, 5) == "ansi_" then
        name = name:sub(6)
    end

    if not ansi_index_lookup[name] then
        error("ANSI color `" .. name .. "` not found.")
    end

    return ansi_index_lookup[name]
end

function SystemTheme.font(name)
    return theme_dict.fonts[name]
end

return SystemTheme