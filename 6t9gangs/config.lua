Config = {}

Config.GangDoors = {
    {coords = vector3(-267.0, -960.0, 31.0), locked = true},
    {coords = vector3(100.0, -200.0, 50.0), locked = true},
}
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('gangs:updateDoors')
AddEventHandler('gangs:updateDoors', function(doors)
    for i, door in pairs(doors) do
        -- Add logic to update door locks visually
    end
end)

RegisterNetEvent('gangs:spawnGangVehicle')
AddEventHandler('gangs:spawnGangVehicle', function(vehicleModel)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    
    QBCore.Functions.SpawnVehicle(vehicleModel, function(vehicle)
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        SetVehicleNumberPlateText(vehicle, "GANG"..math.random(100, 999))
    end, coords, true)
end)

RegisterNetEvent('gangs:openGangGarage')
AddEventHandler('gangs:openGangGarage', function(gang)
    -- Logic to show gang vehicle menu (can be done via QB-Menu or QB-Target)
    print("Gang Garage opened for:", gang)
end)
