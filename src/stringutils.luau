--!strict

local types = require(script.Parent.types)

local StringUtils = {} :: types.StringUtils

function StringUtils.trim(s: string): string
	return s:match("^%s*(.-)%s*$") or s
end

function StringUtils.startsWith(s: string, prefix: string): boolean
	return s:sub(1, #prefix) == prefix
end

function StringUtils.endsWith(s: string, suffix: string): boolean
	return s:sub(-#suffix) == suffix
end

function StringUtils.split(s: string, sep: string): { string }
	local result = {}
	for part in s:gmatch("([^" .. sep .. "]+)") do
		table.insert(result, part)
	end
	return result
end

function StringUtils.join(list: { string }, sep: string): string
	return table.concat(list, sep)
end

return StringUtils
