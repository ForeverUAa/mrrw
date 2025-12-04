--!strict

-- Terminal color utility (Luau)

local types = require(script.Parent.types)

local Chalk: types.Chalk = {} :: types.Chalk
Chalk.__index = Chalk

-- ANSI color map
local COLORS = {
	reset   = "\27[0m",
	black   = "\27[30m",
	red     = "\27[31m",
	green   = "\27[32m",
	yellow  = "\27[33m",
	blue    = "\27[34m",
	magenta = "\27[35m",
	cyan    = "\27[36m",
	white   = "\27[37m",
}

-- Generic color wrapper
local function wrap(text: string, code: string): string
	return code .. text .. COLORS.reset
end

-- Metatable magic: Chalk.red("Hello"), Chalk.yellow("Warning")
setmetatable(Chalk, {
	__index = function(_, key)
		local code = COLORS[key]
		if code == nil then
			error(("Unknown color '%s'"):format(key), 2)
		end

		return function(text: string)
			return wrap(text, code)
		end
	end,
})

-- Manual color function if needed
function Chalk.colorText(text: string, colorName: string): string
	local code = COLORS[colorName]
	if not code then
		error(("Unknown color '%s'"):format(colorName), 2)
	end
	return wrap(text, code)
end

return Chalk
