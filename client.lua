local ESX = nil
local QBCore = nil
local PlayerData = {}

Citizen.CreateThread(function()
    if Config.Framework == 'esx' then
        ESX = exports["es_extended"]:getSharedObject()
        while ESX == nil do
            Citizen.Wait(100)
        end
        PlayerData = ESX.GetPlayerData()
    elseif Config.Framework == 'qbcore' then
        QBCore = exports['qb-core']:GetCoreObject()
        while QBCore == nil do
            Citizen.Wait(100)
        end
        PlayerData = QBCore.Functions.GetPlayerData()
    end

    local blip = AddBlipForCoord(Config.Blip.Pos.x, Config.Blip.Pos.y, Config.Blip.Pos.z)
    SetBlipSprite(blip, Config.Blip.Sprite)
    SetBlipDisplay(blip, Config.Blip.Display)
    SetBlipScale(blip, Config.Blip.Scale)
    SetBlipColour(blip, Config.Blip.Colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blip.Name)
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local distance = GetDistanceBetweenCoords(coords, Config.MarkerPos.x, Config.MarkerPos.y, Config.MarkerPos.z, true)

        if distance < 10.0 then
            DrawMarker(Config.MarkerType, Config.MarkerPos.x, Config.MarkerPos.y, Config.MarkerPos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, false, true, 2, false, nil, nil, false)

            if distance < 1.5 then
                ESX.ShowHelpNotification("Presiona ~y~[~INPUT_CONTEXT~~y~] ~w~para pagar $"..Config.JobPrice.." y obtener el trabajo de taxista por "..Config.JobDuration.." días.")
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('RH_31DaysForWwork:purchaseJob')
                end
            end
        end
        Citizen.Wait(0)
    end
end)
