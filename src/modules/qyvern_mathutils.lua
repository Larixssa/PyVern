local mathutils = {}

--- Checks if a number is positive.
---
--- *`n > 0` = positive*
function mathutils.checkPositive(n)
	local isPositive = false
	if (n > 0) then
		isPositive = true
	end
	return isPositive
end


--- Checks if a number is negative.
---
--- *`n < 0` = negative*
function mathutils.checkNegative(n)
	local isNegative = false
	if (n < 0) then
		isNegative = true
	end
	return isNegative
end

return mathutils
