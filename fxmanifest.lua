version("1.1.4")
author("legendsSystems")
description("FXServer logs to Discord (https://legends.systems/)")
repository("https://github.com/legendsSystems/legendsLogs")

-- Server Scripts
server_scripts({
	"server/server.lua",
	"server/functions.lua",
	"server/explotions.lua",
	"server/serverAC.lua",
	"config/notifications.lua",
})

--Client Scripts
client_scripts({
	"client/client.lua",
	"client/functions.lua",
	"client/weapons.lua",
	"client/clientAC.lua",
})

files({
	"config/eventLogs.json",
	"config/config.json",
	"locals/*.json",
})

lua54("yes")
game("gta5")
fx_version("cerulean")
