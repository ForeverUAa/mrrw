--!strict

local types = require(script.Parent.types)

local Timer = {} :: types.Timer

function Timer.time(fn: () -> ()): number
	local start = os.clock()
	fn()
	return os.clock() - start
end

function Timer.start(): types.Stopwatch
	local startTime = os.clock()

	local sw: types.Stopwatch = {} :: types.Stopwatch

	function sw.elapsed(): number
		return os.clock() - startTime
	end

	function sw.reset()
		startTime = os.clock()
	end

	return sw
end

return Timer
