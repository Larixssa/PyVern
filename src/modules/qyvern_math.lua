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

return qyvern_math
