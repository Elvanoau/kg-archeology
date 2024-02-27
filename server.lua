local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('kg-archaeology:server:Reward', function(inZone)
    if not inZone then return end

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rand = math.random(1, 100)
    local item = nil

    for k, v in pairs(Config.Rewards) do
        if v.chance <= rand then
            item = v.item
        end
    end

    Player.Functions.AddItem(item, 1)
end)

QBCore.Functions.CreateUseableItem(Config.Setup.trowelName, function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.GetItemByName(item.name) then return end

    TriggerClientEvent("kg-archaeology:client:SearchZone", source)
end)