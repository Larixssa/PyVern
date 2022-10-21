local file = {}

--- Reads the data from a file and returns it.
---
--- [Original Source](https://stackoverflow.com/a/31857671)
function file.readFile(path)
	local open = io.open
	local f = open(path, "rb")
	if not f then
		return nil
	end
	local c = f:read "*a"
	f:close()
	return c
end

--- Writes data and text to a specific file.
function file.writeFile(file, text)
	local open = io.open
	local f = open(file, "a")
	if not f then return nil end
	f:write(text, "\n")
	f:close()
end

--- No description.
function file.writeFileBytes(file, text)
	local open = io.open
	local f = open(file, "wb")
	if not f then return nil end
	f:write(text)
	f:close()
end

--- Create a file.
function file.createFile(filename, ext)
	local strutils = require("src.modules.io.qystrutils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local sys = require("src.modules.sys.qysys")
	local ps_exec  = require("src.modules.sys.ps_exec")
	local qos = require("src.modules.qylib.q_os")
	local jit = require("jit")
	if not (strutils.checkNil(filename) and strutils.checkNil(ext)) then
		if (strutils.typeCheck(filename, "string") and strutils.typeCheck(ext, "string")) then
			local file = filename .. "." .. ext
			if (strutils.checkStringEquals(jit.os, qos.getCurrentOS("Linux"))) then
				sys.osExecute("touch " .. file)
			elseif (strutils.checkStringEquals(jit.os, qos.getCurrentOS("Windows"))) then
				ps_exec.exec_common_action("new-item", filename .. ext)
			end
		end
	else
		errorutils.execThrowError("missing", "filename and file extension")
	end
end

--- Check if a file exists.
---
--- [Original Source](https://stackoverflow.com/a/40195356)
function file.exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if (code == 13) then
			return true
		end
	end
	return ok, err
end

--- Check if a directory exists
---
--- [Original Source](https://stackoverflow.com/a/40195356)
function file.chkDir(path)
	return file.exists(path.."/")
end

--- Clears all of the contents from a specific file.
---
--- [Original Source](https://stackoverflow.com/a/45805718)
function file.clearFile(file)
	io.open(file, "w"):close()
end

return file
