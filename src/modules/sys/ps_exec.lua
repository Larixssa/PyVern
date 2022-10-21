local ps_exec = {}

--- Execute a powershell command.
function ps_exec.exec_cmd(cmd_str)
	local strutils = require("src.modules.io.qystrutils")
	if (strutils.typeCheck(cmd_str, "string")) then
		if not (strutils.checkNil(cmd_str)) then
			local ps_proc = io.popen("powershell -command " .. cmd_str, "w")
			ps_proc:close()
		end
	end
end

--- Execute a common action / command.
---
--- [Actions List]:
---
---		| "new-item" -- Create a new item / file.
---		| "make-directory" -- Create a new directory.
function ps_exec.exec_common_action(act_str, act_arg)
	local strutils = require("src.modules.io.qystrutils")
	local str_equals = strutils.checkStringEquals
	local cmd_proc
	local proc
	if (strutils.typeCheck(act_str, "string")) then
		if not (strutils.checkNil(act_str)) then
			if (str_equals(act_str, "new-item")) then
				cmd_proc = "ni " .. act_arg
			elseif (str_equals(act_str, "make-directory")) then
				cmd_proc = "mkdir " .. act_arg
			end
			proc = io.popen("powershell -command " .. cmd_proc, "w")
			proc:close()
		end
	end
end

return ps_exec