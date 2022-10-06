local init = require("src.modules.init.init_client")
local file = require("src.modules.qylib.file")
local failedconfigsetup = require("src.modules.gui.failed_config_setup")

function main()
	if (file.chkDir("config")) then
		init.InitClient(true, true, true, true)
	else
		failedconfigsetup.create()
	end
end

main()
