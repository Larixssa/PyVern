local create_gui = {}

local function getSCursor()
	local c = require("src.modules.display.cursor")
	local paths = require("src.modules.cl.paths")
	return c.getSelectionCursor(paths.getConfigProperty("selection-cursor"))
end

local function create_gui_type(cur_gui)
	local current_gui = cur_gui
	local ui_name
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local file = require("src.modules.qylib.file")
	local console_displayer = require("src.modules.display.console_displayer")
	local paths = require("src.modules.cl.paths")
	local sys = require("src.modules.sys.qysys")
	local ps_exec = require("src.modules.sys.ps_exec")
	local read = io.read
	local name
	if (strutils.typeCheck(current_gui, "string")) then
		if not (strutils.checkNil(current_gui)) then
			if (strutils.checkStringEquals(current_gui, "script-create")) then
				ui_name = "Script"
			elseif (strutils.checkStringEquals(current_gui, "module-create")) then
				ui_name = "Module"
			elseif (strutils.checkStringEquals(current_gui, "external-module-create")) then
				ui_name = "External Module"
			end
			oututils.lnOutStr("\n[ " .. ui_name .. " Creation GUI. ]", true)
			oututils.writeStr(getSCursor() .. " New " .. ui_name .. " Name: ")
			name = read()
			if (strutils.typeCheck(name, "string")) then
				if not (strutils.checkNil(name)) then
					file.createFile(name, ".txt")
					local dir
					if (strutils.checkStringEquals(current_gui, "script-create")) then
						dir = "src/scripts/"
					elseif (strutils.checkStringEquals(current_gui, "module-create")) then
						dir = "src/modules/"
					elseif (strutils.checkStringEquals(current_gui, "external-module-create")) then
						dir = "src/ext_modules/"
					end
					ps_exec.exec_cmd("mv " .. name .. ".txt " .. dir)
					oututils.lnOutStr(getSCursor() .. " " .. ui_name .. ": \"" .. name .. "\"" .. " successfully created.\n", true)
					console_displayer.displayConsoleMessage(ui_name .. ": \"" .. name .. "\"" .. " created.", "wf", paths.getLogfilePath())
				else
					errorutils.execThrowError("missing", strutils.lowerStr(ui_name) .. " name")
				end
			end
		else
			errorutils.execThrowError("missing", "current gui create mode")
		end
	end
end

--- Create a GUI for creating scripts / modules / external modules.
---
--- [Create modes]:
---
---		| "create-script"
---		| "create-module"
---		| "create-ext-module"
function create_gui.initGui(gui_type)
	local strutils = require("src.modules.io.qystrutils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local console_displayer = require("src.modules.display.console_displayer")
	local s_equals = strutils.checkStringEquals
	if (strutils.typeCheck(gui_type, "string")) then
		if not (strutils.checkNil(gui_type)) then
			console_displayer.displayConsoleMessage("Current create mode: " .. gui_type)
			if (s_equals(gui_type, "create-script")) then
				create_gui_type("script-create")
			elseif (s_equals(gui_type, "create-module")) then
				create_gui_type("module-create")
			elseif (s_equals(gui_type, "create-ext-module")) then
				create_gui_type("external-module-create")
			end
		else
			errorutils.execThrowError("missing", "gui create type")
		end
	end
end

return create_gui
