--!strict
-- Types for mrrw

local Types = {}

----------------------------------------------------------------------
-- Config
----------------------------------------------------------------------

export type Config = {
	projectName: string,
	sourceDir: string,
	buildDir: string,
	excludePatterns: { string },
	includePatterns: { string },
}

----------------------------------------------------------------------
-- Math
----------------------------------------------------------------------

export type Math = {
	clamp: (value: number, minValue: number, maxValue: number) -> number,
	lerp: (a: number, b: number, t: number) -> number,
	inverseLerp: (a: number, b: number, value: number) -> number,
	remap: (inMin: number, inMax: number, outMin: number, outMax: number, value: number) -> number,
	mapRangeClamped: (inMin: number, inMax: number, outMin: number, outMax: number, value: number) -> number,
	sign: (x: number) -> number,
	isWithin: (value: number, minValue: number, maxValue: number) -> boolean,
	round: (x: number) -> number,
	floorTo: (x: number, step: number) -> number,
	ceilTo: (x: number, step: number) -> number,
	factorial: (n: number) -> number,
	LambertW: (x: number) -> number,
}

----------------------------------------------------------------------
-- Chalk
----------------------------------------------------------------------

export type Chalk = {
	colorText: (text: string, colorName: string) -> string,

	-- e.g. Chalk.red("hello")
	[string]: (text: string) -> string,
}

----------------------------------------------------------------------
-- StringUtils
----------------------------------------------------------------------

export type StringUtils = {
	trim: (s: string) -> string,
	startsWith: (s: string, prefix: string) -> boolean,
	endsWith: (s: string, suffix: string) -> boolean,
	split: (s: string, sep: string) -> { string },
	join: (parts: { string }, sep: string) -> string,
}

----------------------------------------------------------------------
-- TableUtils
----------------------------------------------------------------------

export type TableUtils = {
	copy: (t: {}) -> {},
	deepCopy: (t: any) -> any,
	merge: (a: {}, b: {}) -> {},
	map: (list: { any }, fn: (any) -> any) -> { any },
	filter: (list: { any }, fn: (any) -> boolean) -> { any },
}

----------------------------------------------------------------------
-- FS
----------------------------------------------------------------------

export type FS = {
	getExtension: (path: string) -> string,
	stripExtension: (path: string) -> string,
	join: (...string) -> string,
	matchesPattern: (str: string, pattern: string) -> boolean,
}

----------------------------------------------------------------------
-- Logger
----------------------------------------------------------------------

export type Logger = {
	info: (msg: string) -> (),
	warn: (msg: string) -> (),
	error: (msg: string) -> (),
	success: (msg: string) -> (),
}

----------------------------------------------------------------------

----------------------------------------------------------------------
-- Easing
----------------------------------------------------------------------
export type Easing = {
	linear: (t: number) -> number,
	quadIn: (t: number) -> number,
	quadOut: (t: number) -> number,
	quadInOut: (t: number) -> number,
	cubicIn: (t: number) -> number,
	cubicOut: (t: number) -> number,
	cubicInOut: (t: number) -> number,
}

----------------------------------------------------------------------
-- Path
----------------------------------------------------------------------
export type Path = {
	normalize: (p: string) -> string,
	join: (...string) -> string,
	basename: (p: string) -> string,
	dirname: (p: string) -> string,
}

----------------------------------------------------------------------
-- UUID
----------------------------------------------------------------------
export type UUID = {
	generate: () -> string,
}

----------------------------------------------------------------------
-- Timer & Stopwatch
----------------------------------------------------------------------
export type Stopwatch = {
	elapsed: () -> number,
	reset: () -> (),
}

export type Timer = {
	time: (fn: () -> ()) -> number,
	start: () -> Stopwatch,
}


return Types
