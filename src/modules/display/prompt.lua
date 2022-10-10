local prompt = {}

--- Create and display a prompt.
function prompt.createPrompt(prompt_msg, prompt_type, prompt_subtype)
	local strutils = require("src.modules.io.qystrutils")
	local oututils =  require("src.modules.io.qyoututils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	if not (strutils.checkNil(prompt_msg) and strutils.checkNil(prompt_type)) then
		oututils.writeStr(prompt_msg .. " ")
		if (strutils.checkStringEquals(prompt_type, "yn") or strutils.checkStringEquals(prompt_type, "yx")) then
			local y = "y"
			local x = "x"
			if not (strutils.checkNil(prompt_subtype)) then
				if (strutils.checkStringEquals(prompt_subtype, "parenthesis")) then
					oututils.writeStr("(" .. strutils.upperStr(y) .. "/" .. strutils.upperStr(x) .. ") ")
				elseif (strutils.checkStringEquals(prompt_subtype, "square_prompt")) then
					oututils.writeStr("( [" .. strutils.upperStr(y) .. "] | [" .. strutils.upperStr(x) .. "] ) ")
				end
			else
				errorutils.execThrowError("nilornull", "Prompt Subtype")
			end
		end
	else
		errorutils.execThrowError("nilornull", "Prompt Message")
	end
end

--- Creates a callback for a prompt.
function prompt.promptCallback(s_opt, e_opt, ce_opt, callback, second_callback)
	local strutils = require("src.modules.io.qystrutils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local file = require("src.modules.qylib.file")
	local paths = require("src.modules.cl.paths")
	local nilcheck = strutils.checkNil
	local equalstrcheck = strutils.checkStringEquals
	if not (nilcheck(s_opt) and nilcheck(e_opt) and nilcheck(ce_opt) and nilcheck(callback) and nilcheck(second_callback)) then
		if (equalstrcheck(s_opt, e_opt) or equalstrcheck(s_opt, ce_opt)) then
			if (strutils.typeCheck(callback, "function")) then
				file.writeFile(paths.getLogfilePath(), "Callback completed.")
				callback()
			end
		else
			if (strutils.typeCheck(second_callback, "function")) then
				file.writeFile(paths.getLogfilePath(), "Second callback completed.")
				second_callback()
			end
		end
	else
		errorutils.execThrowError("bad_argument", "prompt callback")
	end
end

return prompt
