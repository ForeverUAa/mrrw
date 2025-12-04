--!strict
--[[
    UUID Module
    Generates RFC4122-style UUID v4 strings.

    --@roblox:
    This module is safe. It does NOT access the filesystem,
    execute external code, or interact with networking.
    It only uses math.random() to generate unique identifiers
    for gameplay or client/server communication.
]]

local types = require(script.Parent.types)

local UUID = {} :: types.UUID

local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"

function UUID.generate(): string
	return (template:gsub("[xy]", function(c)
		local r = math.random(0, 15)
		local v = (c == "x") and r or (r % 4 + 8)
		return string.format("%x", v)
	end))
end

return UUID
