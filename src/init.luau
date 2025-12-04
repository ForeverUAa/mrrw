-- mrrw — created by Tverdohlib

local types = require(script.types)

-- Core modules
local mathModule = require(script.math) :: types.Math
local chalkModule = require(script.chalk) :: types.Chalk
local stringUtils = require(script.stringutils) :: types.StringUtils
local tableUtils = require(script.tableutils) :: types.TableUtils
local fs = require(script.fs) :: types.FS
local logger = require(script.logger) :: types.Logger

-- Extra modules
local easing = require(script.easing) :: types.Easing
local path = require(script.path) :: types.Path
local uuid = require(script.uuid) :: types.UUID
local timer = require(script.timer) :: types.Timer

local VERSION = "1.0.0"

local mrrw = {
	-- Core utilities
	math = mathModule,
	chalk = chalkModule,
	stringUtils = stringUtils,
	tableUtils = tableUtils,
	fs = fs,
	logger = logger,

	-- Extra utilities
	easing = easing,
	path = path,
	uuid = uuid,
	timer = timer,
}

-- Get current version
function mrrw.getVersion(): string
	return VERSION
end

return mrrw
