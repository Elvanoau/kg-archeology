local QBCore = exports['qb-core']:GetCoreObject()
local inZone = false

RegisterNetEvent('kg-archaeology:client:SearchZone', function()

    if Config.Setup.useBothItems == true and not QBCore.Functions.HasItem(Config.Setup.brushName) then
        return
    end

    TriggerEvent('animations:client:EmoteCommandStart', {"medic2"})
    QBCore.Functions.Progressbar('dig', 'Carefully Digging...', (Config.Setup.searchTime.stage1 * 1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        }, {}, {}, {}, function() -- Complete
            TriggerEvent('kg-archaeology:client:Stage2')
        end, function() -- Cancel
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('kg-archaeology:client:Stage2', function()
    QBCore.Functions.Progressbar('dig', 'Carefully Brushing...', (Config.Setup.searchTime.stage2 * 1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        }, {}, {}, {}, function() -- Complete
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('kg-archaeology:server:Reward', inZone)
        end, function() -- Cancel
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

Citizen.CreateThread(function()
    local archaeologyZone = CircleZone:Create(Config.Zone.coords, Config.Zone.radius, {
		name = "archaeologyZone",
		debugPoly = Config.Debug
	})
	archaeologyZone:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            inZone = true
            exports['qb-core']:DrawText('In Fossile Zone', 'right')
        else
            inZone = false
            exports['qb-core']:HideText()
        end
    end)

    local Blipv3 = Config.Zone.coords
    local Blip = AddBlipForCoord(Blipv3.x, Blipv3.y, Blipv3.z)
    SetBlipSprite (Blip, 273)
    SetBlipDisplay(Blip, 4)
    SetBlipScale  (Blip, 0.6)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 0)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Archeology")     -- Name Of Bip Here
    EndTextCommandSetBlipName(Blip)
end)