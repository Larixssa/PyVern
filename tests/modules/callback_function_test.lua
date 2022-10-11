local function execFn(fn)
	if (type(fn) == "function") then
		fn()
	end
end

execFn(function()
	print("Hi")
end)
