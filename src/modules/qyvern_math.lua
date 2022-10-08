local qyvern_math = {}

--- Add two numbers and retursn the sum.
---
--- *`a` + `b` = sum*
function qyvern_math.getSumOf(a, b)
	local sum = a + b
	return sum
end

--- Subtract two numbers and returns the difference.
---
--- *`a` - `b` = difference*
function qyvern_math.getDiffOf(a, b)
	local difference = a - b
	return difference
end

--- Multiply two numbers and returns the product.
---
--- *`a` * `b` = difference*
function qyvern_math.getProdOf(a, b)
	local product = a * b
	return product
end

--- Divide two numbers and returns the quotient.
---
--- *`a` / `b` = difference*
function qyvern_math.getQuotOf(a, b)
	local quotient = a / b
	return quotient
end

--- Get the square root of a certain number and returns it.
---
--- *`n` = `x ^ (1/2)*
function qyvern_math.sqrtOf(num)
	local squared = num ^ (1 / 2)
	return squared
end

--- Multiply a number by itself two times, adn return the square root.
---
--- *`sqrt` = `n * n`*
function qyvern_math.sqrt(n)
	local square_root = n * n
	return square_root
end

--- Get the cube root of a certain number and returns it.
---
--- *`n` = `x ^ (1/3)*
function qyvern_math.cbrtOf(num)
	local cubed = num ^ (1 / 3)
	return cubed
end

--- Multiply a number by itself three times, and return the cube root.
---
--- *`sqrt` = `n * n * n`*
function qyvern_math.cbrt(n)
	local square_root = n * n * n
	return square_root
end

--- Define an exponent value, and it multiplies "n" by itself depending on the exponent, and returns it.
---
--- *`v` = `n^e`*
function qyvern_math.expo(e, n)
	local v = n^e
	return v
end

--- Get the area of certain shapes.
---
--- *[ PARAMETERS DESCRIPTION ]*
---
--- *``shape``*: string
---
--- *``n``*: number
---
--- *``m``*: number <- (used for getting the area of a triangle and etc.)
---
--- *``l``*: number <- (used for getting the area of a trapezoid / trapezium and etc.)
function qyvern_math.getAreaOf(shape, n, m, p)
	local strutils  = require("src.modules.qyvern_strutils")
	local m_utils = require("src.modules.qyvern_mathutils")
	local convert = require("src.modules.qylib.convert")
	local s_equals = strutils.checkStringEquals
	local positive = m_utils.checkPositive
	local area
	local v
	if (strutils.typeCheck(shape, "string")) then
		if not (strutils.checkNil(shape)) then
			if (positive(n) and positive(m) and positive(p)) then
				if (s_equals(shape, "square")) then
					local side = n * n
					area = side
				elseif (s_equals(shape, "rectangle") or s_equals(shape, "parallelogram")) then
					local l, w = n, m
					area = l * w
				elseif (s_equals(shape, "triangle")) then
					local base, height = n, m
					area = (base * height) / 2
				elseif (s_equals(shape, "circle")) then
					local pi, radius = math.pi --[[ π ]], n * n
					area = pi * (radius)
				elseif (s_equals(shape, "trapezoid") or s_equals(shape, "trapezium")) then
					local base1, base2, height = n, m, p
					area = (base1 + base2) / 2 * height
				end
			end
		end
	end
	v = convert.toNumber(area)
	return v
end

return qyvern_math
