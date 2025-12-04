--!strict
--!optimize 2

-- Math utilities for mrrw

local types = require(script.Parent.types)

local m = math
local Math: types.Math = {} :: types.Math

---------------------------------------------------------------------
-- Basic
---------------------------------------------------------------------

function Math.clamp(value: number, minValue: number, maxValue: number): number
	if value < minValue then
		return minValue
	elseif value > maxValue then
		return maxValue
	end
	return value
end

function Math.lerp(a: number, b: number, t: number): number
	return a + (b - a) * t
end

function Math.inverseLerp(a: number, b: number, value: number): number
	if a == b then return 0 end
	return (value - a) / (b - a)
end

function Math.remap(inMin: number, inMax: number, outMin: number, outMax: number, value: number): number
	local t = Math.inverseLerp(inMin, inMax, value)
	return Math.lerp(outMin, outMax, t)
end

function Math.mapRangeClamped(inMin: number, inMax: number, outMin: number, outMax: number, value: number): number
	local t = Math.clamp(Math.inverseLerp(inMin, inMax, value), 0, 1)
	return Math.lerp(outMin, outMax, t)
end

function Math.sign(x: number): number
	return (x > 0 and 1) or (x < 0 and -1) or 0
end

function Math.isWithin(value: number, minValue: number, maxValue: number): boolean
	return value >= minValue and value <= maxValue
end

---------------------------------------------------------------------
-- Rounding
---------------------------------------------------------------------

function Math.round(x: number): number
	return m.floor(x + 0.5)
end

function Math.floorTo(x: number, step: number): number
	return m.floor(x / step + 1e-9) * step
end

function Math.ceilTo(x: number, step: number): number
	return m.ceil(x / step - 1e-9) * step
end

---------------------------------------------------------------------
-- Factorial (memoized)
---------------------------------------------------------------------

local factorialCache: { [number]: number } = { [0] = 1 }

function Math.factorial(n: number): number
	if n < 0 then
		error("Factorial is not defined for negative numbers")
	end

	local cached = factorialCache[n]
	if cached then
		return cached
	end

	local result = 1
	for i = 1, n do
		result *= i
	end

	factorialCache[n] = result
	return result
end

---------------------------------------------------------------------
-- Lambert W (Newton iteration)
---------------------------------------------------------------------

function Math.LambertW(x: number): number
	if x < -1 / m.exp(1) then
		error("Input must be greater than or equal to -1/e")
	end

	local w = (x >= 1) and m.log(x) or x
	local tolerance = 1e-10

	for _ = 1, 50 do
		local eW = m.exp(w)
		local wNext = w - (w * eW - x) / (eW * (w + 1))

		if m.abs(wNext - w) < tolerance then
			return wNext
		end

		w = wNext
	end

	return w
end

---------------------------------------------------------------------

return Math
