local oututils = {}

local write = io.write

local strutils = require("src.modules.qyvern_strutils")
local errorutils = require("src.modules.qyvern_errorutils")

--- Standard "print" function with nil checking.
function oututils.lnOutStr(str, createNewLine)
	if not (strutils.checkNil(str)) then
		write(str) oututils.createEscSeq("newline", createNewLine)
	else
		errorutils.execThrowError("nilornull", "String")
	end
end

--- Standard "io.write" function.
function oututils.writeStr(str)
	if not (strutils.checkNil(str)) then
		write(str)
	else
		errorutils.execThrowError("nilornull", "String")
	end
end

-- Repeats a certain string.
function oututils.repeatStr(minmax, times, str, create_newline)
	if not (strutils.checkNil(str)) then
		for i = minmax, times do
			oututils.createEscSeq("newline", create_newline) write(str) oututils.createEscSeq("newline", create_newline)
		end
	else
		errorutils.execThrowError("nilornull", "String")
	end
end

function oututils.writeEscSeq(escSeq)
	local s
	if not (strutils.checkNil(escSeq)) then
		if (strutils.startsWith(escSeq, "\n") or strutils.startsWith(escSeq, "\t")) then
			s = escSeq
		end
	else
		s = "\n"
	end
	return s
end

function oututils.createEscSeq(escSeq, conditionVal)
	if not (strutils.checkNil(escSeq)) then
		if (conditionVal) then
				if (strutils.checkStringEquals(escSeq, "\n") or strutils.checkStringEquals(escSeq, "newline")) then write("\n")
				elseif (strutils.scheckStringEquals(escSeq, "\t") or strutils.checkStringEquals(escSeq, "tab")) then write("\t")
				else write("\n")
			end
		end
	else
		errorutils.execThrowError("nilornull", "Escape Sequence")
	end
end

return oututils
