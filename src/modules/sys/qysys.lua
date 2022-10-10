local qyvern_sys = {}

--- Same as os.execute() but with "nil" string checking.
function qyvern_sys.osExecute(cmd)
	local strutils = require("src.modules.io.qystrutils")
	if not (strutils.checkNil(cmd) or strutils.checkEmpty(cmd)) then
		os.execute(tostring(cmd))
	end
end

--- Clears the screen.
function qyvern_sys.clearScreen()
	local strutils = require("src.modules.io.qystrutils")
	local q_os = require("src.modules.qylib.q_os")
	local jit = require("jit")
	if (strutils.checkStringEquals(jit.os, q_os.getCurrentOS("Linux"))) then
		qyvern_sys.osExecute("clear")
	elseif (strutils.checkStringEquals(jit.os, q_os.getCurrentOS("Windows"))) then
		qyvern_sys.osExecute("cls")
	end
end

--- Exits the Program.
function qyvern_sys.exitProgram()
	os.execute("exit")
end

return qyvern_sys
