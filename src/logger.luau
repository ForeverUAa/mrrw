--!strict

local types = require(script.Parent.types)
local Chalk = require(script.Parent.chalk) :: types.Chalk

local Logger = {} :: types.Logger

local function now(): string
	return os.date("%H:%M:%S")
end

function Logger.info(msg: string)
	print(Chalk.cyan(("[%s] INFO  >> %s"):format(now(), msg)))
end

function Logger.warn(msg: string)
	print(Chalk.yellow(("[%s] WARN  >> %s"):format(now(), msg)))
end

function Logger.error(msg: string)
	print(Chalk.red(("[%s] ERROR >> %s"):format(now(), msg)))
end

function Logger.success(msg: string)
	print(Chalk.green(("[%s] OK    >> %s"):format(now(), msg)))
end

return Logger
