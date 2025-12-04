--[[
local types = require(script.Parent.types)

local FS = {} :: types.FS

function FS.getExtension(path: string): string
	return path:match("^.+(%..+)$") or ""
end

function FS.stripExtension(path: string): string
	return path:gsub("%.%w+$", "")
end

function FS.join(...)
	local parts = { ... }
	return table.concat(parts, "/")
end

function FS.matchesPattern(str: string, pattern: string): boolean
	local luaPattern = pattern:gsub("%%", "%%%%"):gsub("%*", ".*")
	return str:match("^" .. luaPattern .. "$") ~= nil
end

return FS
]]
