--!strict

local types = require(script.Parent.types)

local TableUtils = {} :: types.TableUtils

function TableUtils.copy(t: {}): {}
	local new = {}
	for k, v in pairs(t) do new[k] = v end
	return new
end

function TableUtils.deepCopy(t: any): any
	if type(t) ~= "table" then return t end
	local new = {}
	for k, v in pairs(t) do
		new[TableUtils.deepCopy(k)] = TableUtils.deepCopy(v)
	end
	return new
end

function TableUtils.merge(a: {}, b: {}): {}
	local r = TableUtils.copy(a)
	for k, v in pairs(b) do r[k] = v end
	return r
end

function TableUtils.map(list: { any }, fn: (any) -> any): { any }
	local r = {}
	for i, v in list do r[i] = fn(v) end
	return r
end

function TableUtils.filter(list: { any }, fn: (any) -> boolean): { any }
	local r = {}
	for _, v in list do
		if fn(v) then table.insert(r, v) end
	end
	return r
end

return TableUtils
