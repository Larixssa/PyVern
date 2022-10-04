-- Source: https://github.com/jonstoler/lua-snip/blob/master/string/trim.lua

return function(l)
	return l:gsub("^%s*(.-)%s*$", "%1")
end