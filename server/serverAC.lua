local configFile = LoadResourceFile(GetCurrentResourceName(), "config/config.json")
local cfgFile = json.decode(configFile)

local ACconfigFile = LoadResourceFile(GetCurrentResourceName(), "config/ac_config.json")
local ACcfgFile = json.decode(ACconfigFile)

local localsFile = LoadResourceFile(GetCurrentResourceName(), "locals/" .. cfgFile["locals"] .. ".json")
local lang = json.decode(localsFile)

if cfgFile["EnableAcFunctions"] then
	RegisterNetEvent("legendsSystems:DropPlayer")
	AddEventHandler("legendsSystems:DropPlayer", function(reason)
		if not IsPlayerAceAllowed(source, cfgFile["AntiCheatBypass"]) then
			DropPlayer(source, "Automated kick: " .. reason)
		end
	end)

	RegisterNetEvent("legendsSystems:getACConfig")
	AddEventHandler("legendsSystems:getACConfig", function()
		TriggerClientEvent("legendsSystems:SendACConfig", source, ACcfgFile)
	end)

	local validResourceList
	local function collectValidResourceList()
		validResourceList = {}
		for i = 0, GetNumResources() - 1 do
			validResourceList[GetResourceByFindIndex(i)] = true
		end
	end

	AddEventHandler("onResourceListRefresh", collectValidResourceList)
	RegisterNetEvent("legendsSystems:resourceCheck")
	AddEventHandler("legendsSystems:resourceCheck", function(rcList)
		local source = source
		collectValidResourceList()
		Wait(500)
		for _, resource in ipairs(rcList) do
			if not validResourceList[resource] then
				TriggerEvent("ACCheatAlert", { target = source, reason = "URD", kick = true })
			end
		end
	end)
end
