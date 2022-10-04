local prompt = {}

--- Create and display a prompt.
function prompt.createPrompt(prompt_msg, prompt_type, prompt_subtype)
	local strutils = require("src.modules.qyvern_strutils")
	local oututils =  require("src.modules.qyvern_oututils")
	local errorutils = require("src.modules.qyvern_errorutils")
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

return prompt
