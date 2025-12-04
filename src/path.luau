--!strict

local types = require(script.Parent.types)

local Path = {} :: types.Path

local function splitPath(p: string): {string}
	local out = {}
	for part in p:gmatch("[^/]+") do
		table.insert(out, part)
	end
	return out
end

function Path.normalize(p: string): string
	local parts = splitPath(p)
	local stack = {}

	for _, part in parts do
		if part == ".." then
			if #stack > 0 then table.remove(stack) end
		elseif part ~= "." and part ~= "" then
			table.insert(stack, part)
		end
	end

	return "/" .. table.concat(stack, "/")
end

function Path.join(...): string
	local parts = { ... }
	return Path.normalize(table.concat(parts, "/"))
end

function Path.basename(p: string): string
	local normalized = Path.normalize(p)
	return normalized:match("([^/]+)$") or ""
end

function Path.dirname(p: string): string
	local normalized = Path.normalize(p)
	return normalized:match("(.+)/[^/]+$") or "/"
end

return Path
