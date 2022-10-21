-- A more efficient script for setting up QyVern.

local dirs = {
	"config",
	"logs"
}

local files = {
	"cursor.txt",
	"id.txt",
	"profile.txt",
	"repo-desc.txt",
	"selection-cursor.txt"
}

local function setup()
	local sys, ps_exec = require("src.modules.sys.qysys"), require("src.modules.sys.ps_exec")
	local file = require("src.modules.qylib.file")
	local jit = require("jit")
	local repo_desc_dat = "QyVern\n\nA Command-Line Interface (CLI) and engine for creating and running scripts.\n\nRequires LuaJIT (2.0.5) + Modding Support with Lua.\n\nNOTE: Check docs/BUILDING.md and docs/MODIFYING.md for guides on building / modding QyVern."
	if (jit.os == "Windows") then
		for i = 1, 2 do
			ps_exec.exec_cmd("mkdir " .. dirs[i])
		end for i = 1, #files do
			ps_exec.exec_cmd("ni " .. "config/" .. files[i])
		end
	elseif (jit.os == "Linux") then
		for i = 1, 2 do
			sys.osExecute("mkdir " .. dirs[i])
		end for i = 1, #files do
			sys.osExecute("touch " .. "config/" .. files[i])
		end
	end
	file.writeFile("config/cursor.txt", "$")
	file.writeFile("config/selection-cursor.txt", ">")
	file.writeFile("config/profile.txt", "Guest")
	file.writeFile("config/id.txt", "0")
	file.writeFile("config/repo-desc.txt", repo_desc_dat)
end

setup()