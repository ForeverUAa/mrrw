# mrrw

**mrrw** is a lightweight, modular utility library for Roblox Lua. It bundles a set of core and extra utilities for math, strings, tables, filesystem-like paths, UUIDs, and more—basically a mini standard library for Roblox devs. ⚡

---

## Features

### Core Utilities

* `math` – extra math helpers
* `chalk` – colorize output in logs
* `stringUtils` – string helpers
* `tableUtils` – table manipulation (`copy`, `deepCopy`, `merge`, `map`, `filter`)
* `fs` – simple path/file helpers
* `logger` – logging functions

### Extra Utilities

* `easing` – animation easing functions
* `path` – path utilities
* `uuid` – generate RFC4122 v4 UUIDs
* `timer` – simple timers

### Misc

* `mrrw.getVersion()` – get the current version (`1.0.0`)

---

## Installation

**Wally**

```bash
wally add github:YourUsername/mrrw
```

**GitHub**
Clone or download and require the module in your project:

```lua
local mrrw = require(path_to_mrrw)
```

---

## Examples

```lua
local mrrw = require(path_to_mrrw)

-- Table utils
local t1 = {1, 2, 3}
local t2 = {4, 5}
local merged = mrrw.tableUtils.merge(t1, t2) -- {1,2,3,4,5}

-- UUID
local id = mrrw.uuid.generate()
print(id) -- e.g., "f47ac10b-58cc-4372-a567-0e02b2c3d479"

-- File system helpers
local ext = mrrw.fs.getExtension("folder/file.txt") -- ".txt"
local name = mrrw.fs.stripExtension("folder/file.txt") -- "folder/file"
```

---

## Contributing

PRs and suggestions are welcome! Make sure to follow `--!strict` and type annotations to keep the codebase clean.

---

## License

MIT © YourName
