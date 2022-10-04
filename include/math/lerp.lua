-- Source: https://github.com/jonstoler/lua-snip/blob/master/math/lerp.lua

return function(a, b, t)
	return a + (b - a) * t
end