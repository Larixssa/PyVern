-- Source: https://github.com/jonstoler/lua-snip/blob/master/string/split.lua

return function(str, del)
	if (str == "") then
		return {}
	end
	local res = {}
	local app = del
	if (del:match("%%")) then
		app = del:gsub("%%", "")
	end
	for m in (str .. app):gmatch("(.-)" .. del) do
		table.insert(res, m)
	end
	return res
end