local math_ui = {}

local function getSCursor()
	local cursor = require("src.modules.display.cursor")
	local paths = require("src.modules.cl.paths")
	return cursor.getSelectionCursor(paths.getConfigProperty("selection-cursor"))
end

local function operations(operation_type, std_operation)
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local _math = require("src.modules.math.qymath")
	local console_displayer = require("src.modules.display.console_displayer")
	local paths = require ("src.modules.cl.paths")
	local str_equals = strutils.checkStringEquals
	local read = io.read
	local na
	local nb
	oututils.writeStr(getSCursor() .. " Enter first number (a): ")
	na = read()
	oututils.writeStr(getSCursor() .. " Enter second number (b): ")
	nb = read()
	if (strutils.typeCheck(operation_type, "string")) then
		if not (strutils.checkNil(operation_type)) then
			if (str_equals(std_operation, "standard")) then
				local operation
				local c
				if (str_equals(operation_type, "addition")) then
					operation = "+"
					c = _math.getSumOf(na, nb)
				elseif (str_equals(operation_type, "subtraction")) then
					operation = "-"
					c = _math.getDiffOf(na, nb)
				elseif (str_equals(operation_type, "multiplication")) then
					operation = "*"
					c = _math.getProdOf(na, nb)
				elseif (str_equals(operation_type, "division")) then
					operation = "/"
					c = _math.getQuotOf(na, nb)
				end
				oututils.lnOutStr("\n[FORMULA]:\n\na " .. operation .. " b = c \n\n" .. na .. " " .. operation .. " " .. nb .. " = " .. c .. "\n\n")
				console_displayer.displayConsoleMessage("Operation: " .. na .. " " .. operation .. " " .. nb .. " = " .. c .. " Successfully operated.", paths.getLogfilePath()) 
			end
		end
	end
end

function math_ui.init_ui(ui_type)
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	oututils.lnOutStr("\n[ Math Calculator GUI. ]", true)
	if (strutils.typeCheck(ui_type, "string")) then
		if not (strutils.checkNil(ui_type)) then
			operations(ui_type)
		end
	end
end

return math_ui
