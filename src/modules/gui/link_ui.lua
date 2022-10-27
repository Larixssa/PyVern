local link_ui = {}

local function getSelectionCursor()
	local cursor = require("src.modules.display.cursor")
	local paths = require("src.modules.cl.paths")
	return cursor.getSelectionCursor(paths.getConfigProperty("selection-cursor"))
end

function link_ui.create()
	local links = {
		"youtube.com",
		"twitter.com",
		"facebook.com",
		"discord.com",
		"github.com",
		"roblox.com",
		"store.steampowered.com"
	}

	local link_table = {
		"YouTube / youtube.com",
		"Twitter / twitter.com",
		"Facebook / facebook.com",
		"Discord / discord.com",
		"GitHub / github.com",
		"Roblox / roblox.com",
		"Steam / store.steampowered.com"
	}

	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local link = require("src.modules.qylib.link")
	local read = io.read
	local _link
	oututils.lnOutStr("\n[ Open Link GUI. ]", true)
	oututils.writeStr(getSelectionCursor() .. " Link to open: ")
	_link = read()
	local _parse
	if (strutils.typeCheck(_link, "string")) then
		if not (strutils.checkNil(_link) or strutils.checkEmpty(_link)) then
			local parse_table = false
			for i = 1, #link_table do
				if (strutils.findString(_link, links[i])) then
					parse_table = true
					_parse = link_table[i]
				end
			end
			if (parse_table) then
				oututils.lnOutStr(getSelectionCursor() .. "Successfully opened link: " .. _link .. "\nSite: " .. _parse, true)
			else
				oututils.lnOutStr(getSelectionCursor() .. "Successfully opened link: " .. _link, true)
			end
			link.open(_link)
		else
			errorutils.execThrowError("missing", "link data")
		end
	end
end

return link_ui