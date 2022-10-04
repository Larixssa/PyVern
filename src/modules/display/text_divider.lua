local text_divider = {}

--- Displays a line with a certain length.
function text_divider.createTextDivider(lines_length, text_ch, do_newline, second_newline)
	local strutils = require("src.modules.qyvern_strutils")
	local oututils =  require("src.modules.qyvern_oututils")

	if (second_newline) then oututils.writeStr(oututils.writeEscSeq("\n")) end

	if not (strutils.checkNil(text_ch)) then
		oututils.repeatStr(1, lines_length, text_ch, false)
	end

	if (do_newline) then oututils.writeStr(oututils.writeEscSeq("\n")) end
end

return text_divider
