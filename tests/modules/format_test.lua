-- Test format module file

local format = require("src.modules.qylib.format")
local str_var = "Hello!"
format.print_format("%s", str_var)