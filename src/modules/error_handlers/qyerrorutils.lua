local errorutils = {}

--- Execute and throw an error on the user on a certain cause.
function errorutils.execThrowError(_type, kw)
	local strutils = require("src.modules.qyvern_strutils")
	local oututils =  require("src.modules.qyvern_oututils")
	local escSeqWrite = oututils.writeEscSeq
	if not (strutils.checkNil(_type) and strutils.checkNil(kw)) then
		if (strutils.checkStringEquals(_type, "nilornull")) then
			oututils.writeStr("ERROR: NULL / NIL " .. kw .. " value." .. escSeqWrite("\n"))
		elseif (strutils.checkStringEquals(_type, "missing")) then
			oututils.writeStr("<Missing value: " .. strutils.upperStr(string.gsub(kw, " ", "_")) .. ">" .. escSeqWrite("\n"))
		elseif (strutils.checkStringEquals(_type, "bad_argument")) then
			oututils.writeStr("<Bad arguments to function: " .. string.upper(string.gsub(kw, " ", "_")))
		end
	end
end

--- Throws an invalid command error.
function errorutils.invalidCommandError(command_str)
	local strutils = require("src.modules.qyvern_strutils")
	local oututils = require("src.modules.qyvern_oututils")
	if not (strutils.checkNil(command_str)) then
		oututils.writeStr("Invalid command " .. "\"" .. command_str .. "\"" .. oututils.writeEscSeq("\n"))
	end
end

--- Throws an error if the local user's profile already exists.
function errorutils.localUserProfileExists(uname)
	local strutils = require("src.modules.qyvern_strutils")
	local oututils = require("src.modules.qyvern_oututils")
	if not (strutils.checkNil(uname)) then
		oututils.writeStr("User: \"" .. uname .."\", already exists.\n")
	end
end

--- Throws an error if the variable data type is invalid.
function errorutils.invalidTypeError(var, _type)
	local strutils = require("src.modules.qyvern_strutils")
	local oututils = require("src.modules.qyvern_oututils")
	if not (strutils.checkNil(var) and strutils.checkNil(_type)) then
		if (strutils.typeCheck(var) and strutils.typeCheck(_type)) then
			oututils.writeStr("Invalid type - \"" .. _type .. "\", for variable: " .. var)
		end
	end
end

function errorutils.setupFailed(_type, msg_callback)
	local strutils = require("src.modules.qyvern_strutils")
	local oututils = require("src.modules.qyvern_oututils")
	if (strutils.checkNil(_type) and strutils.checkNil(msg_callback)) then
		if (strutils.checkStringEquals(_type, "config_failed")) then
			oututils.writeStr("Setup failed, configuration files needed.")
		end
		if (strutils.typeCheck(msg_callback, "function")) then
			msg_callback()
		end
	end
end

return errorutils
