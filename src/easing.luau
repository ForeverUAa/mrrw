--!strict

local types = require(script.Parent.types)

local m = math
local Easing = {} :: types.Easing

function Easing.linear(t: number): number
	return t
end

function Easing.quadIn(t: number): number
	return t * t
end

function Easing.quadOut(t: number): number
	return t * (2 - t)
end

function Easing.quadInOut(t: number): number
	if t < 0.5 then
		return 2 * t * t
	else
		return -1 + (4 - 2 * t) * t
	end
end

function Easing.cubicIn(t: number): number
	return t * t * t
end

function Easing.cubicOut(t: number): number
	local f = (t - 1)
	return f * f * f + 1
end

function Easing.cubicInOut(t: number): number
	if t < 0.5 then
		return 4 * t * t * t
	else
		local f = (2 * t - 2)
		return 0.5 * f * f * f + 1
	end
end

return Easing
