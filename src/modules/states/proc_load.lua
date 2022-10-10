local proc_load = {}

local function wfConsoleDisplay(str)
	local cd = require("src.modules.display.console_displayer")
	local strutils = require("src.modules.io.qystrutils")
	local paths = require("src.modules.cl.paths")
	if not (strutils.checkNil(str)) then
		cd.displayConsoleMessage(str, "wf", paths.getLogfilePath())
	end
end

function proc_load.doProcessLoad(load_str, min_t, max_t, max_i)
	local errorutils = require("src.modules.qyvern_errorutils")
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local sys = require("src.modules.qyvern_sys")
	local thread = require("src.modules.qylib.thread")
	local mnt
	local mxt
	if (min_t >= 2 and max_t >= 4) then
		mnt = 2
		mxt = 4
	else
		mnt = min_t
		mxt = max_t
	end
	local strtable = {"-", "--", "---", "----", "-----"}
	if not (strutils.checkNil(load_str)) then
		sys.clearScreen()
		if not (strutils.checkEmpty(load_str)) then
			oututils.lnOutStr(load_str .. "...\n> ")
			wfConsoleDisplay(load_str)
		else
			oututils.lnOutStr("Loading...\n> ")
			wfConsoleDisplay("Loading...")
		end
		for i = 1, max_i do
			oututils.writeStr(strtable[math.random(1, 5)])
			if (i >= max_i) then
				oututils.writeStr(" <\nSuccessfully loaded!")
				if (strutils.checkEmpty(load_str)) then
					wfConsoleDisplay("Successfully loaded.")
				else
					wfConsoleDisplay(load_str)
				end
				thread.sleep(3.1)
				sys.clearScreen()
				break
			end
			thread.sleep(math.random((mnt * 100) / 1.5, (mxt * 100) / 1.75))
		end
	else
		errorutils.execThrowError("nilornull", load_str)
	end
end

return proc_load
