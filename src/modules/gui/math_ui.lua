local math_ui = {}

local function getSCursor()
	local cursor = require("src.modules.display.cursor")
	local paths = require("src.modules.cl.paths")
	return cursor.getSelectionCursor(paths.getConfigProperty("selection-cursor"))
end

--[[ local function area_operations(operation_type)
end ]]

local function operations(operation_type)
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local math = require("src.modules.math.qymath")
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
			local operation
			local c
			if (str_equals(operation_type, "addition")) then
				operation = "+"
				c = math.getSumOf(na, nb)
			elseif (str_equals(operation_type, "subtraction")) then
				operation = "-"
				c = math.getDiffOf(na, nb)
			elseif (str_equals(operation_type, "multiplication")) then
				operation = "*"
				c = math.getProdOf(na, nb)
			elseif (str_equals(operation_type, "division")) then
				operation = "/"
				c = math.getQuotOf(na, nb)
			end
			oututils.lnOutStr("\n[FORMULA]:\n\na " .. operation .. " b = c \n\n" .. na .. " " .. operation .. " " .. nb .. " = " .. c .. "\n\n")
		end
	end
end

function math_ui.init_math_ui(ui_type)
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local str_equals = strutils.checkStringEquals
	oututils.lnOutStr("\n[ Math Calculator GUI. ]", true)
	if (strutils.typeCheck(ui_type, "string")) then
		if not (strutils.checkNil(ui_type)) then
			if (str_equals(ui_type, "addition")) then
				operations("addition")
			elseif (str_equals(ui_type, "subtraction")) then
				operations("subtraction")
			elseif (str_equals(ui_type, "multiplication")) then
				operations("multiplication")
			elseif (str_equals(ui_type, "division")) then
				operations("division")
			end
		end
	end
end

return math_ui
