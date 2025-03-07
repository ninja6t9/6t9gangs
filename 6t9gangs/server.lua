local QBCore = exports['qb-core']:GetCoreObject()
local gangDoors = Config.GangDoors

RegisterNetEvent('gangs:addMember')
AddEventHandler('gangs:addMember', function(gang, targetId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local TargetPlayer = QBCore.Functions.GetPlayer(targetId)
    
    if Player.PlayerData.job.name == gang or Player.PlayerData.job.isboss then
        TargetPlayer.Functions.SetJob(gang, 0)
        TriggerClientEvent('QBCore:Notify', targetId, 'You have been added to '..gang, 'success')
    end
end)

RegisterNetEvent('gangs:toggleDoor')
AddEventHandler('gangs:toggleDoor', function(doorIndex)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name then
        gangDoors[doorIndex].locked = not gangDoors[doorIndex].locked
        TriggerClientEvent('gangs:updateDoors', -1, gangDoors)
    end
end)

RegisterNetEvent('gangs:accessStash')
AddEventHandler('gangs:accessStash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name then
        TriggerClientEvent('qb-inventory:client:openGangStash', src, Player.PlayerData.job.name)
    end
end)

RegisterNetEvent('gangs:accessPersonalStash')
AddEventHandler('gangs:accessPersonalStash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-inventory:client:openPersonalStash', src, Player.PlayerData.citizenid)
end)

RegisterNetEvent('gangs:spawnVehicle')
AddEventHandler('gangs:spawnVehicle', function(vehicleModel)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name then
        TriggerClientEvent('gangs:spawnGangVehicle', src, vehicleModel)
    end
end)

RegisterServerEvent('gangs:getDoors')
AddEventHandler('gangs:getDoors', function()
    TriggerClientEvent('gangs:updateDoors', source, gangDoors)
end)

RegisterNetEvent('gangs:accessGangGarage')
AddEventHandler('gangs:accessGangGarage', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player and Player.PlayerData.job.name then
        TriggerClientEvent('gangs:openGangGarage', src, Player.PlayerData.job.name)
    end
end)
