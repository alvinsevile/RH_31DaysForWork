ESX = nil
local QBCore = nil

if Config.Framework == 'esx' then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterServerEvent('RH_31DaysForWwork:purchaseJob')
AddEventHandler('RH_31DaysForWwork:purchaseJob', function()
    local _source = source
    local xPlayer = nil

    if Config.Framework == 'esx' then
        xPlayer = ESX.GetPlayerFromId(_source)
    elseif Config.Framework == 'qbcore' then
        xPlayer = QBCore.Functions.GetPlayer(_source)
    end

    if xPlayer then
        local money = xPlayer.getMoney()
        if money >= Config.JobPrice then
            xPlayer.removeMoney(Config.JobPrice)
            assignBurgerJob(xPlayer)
        else
            TriggerClientEvent('esx:showNotification', _source, 'No tienes suficiente dinero.')
        end
    end
end)

function assignBurgerJob(xPlayer)
    local jobInfo = {
    job = Config.JobName,
    grade = 0,
    job_end_time = os.time() + (60) -- 1 minuto en tiempo real / job_end_time = os.time() + (31 * 24 * 60 * 60) -- 31 días en tiempo real
}

    if Config.Framework == 'esx' then
    xPlayer.setJob(jobInfo.job, jobInfo.grade)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Has recibido el trabajo de taxista durante 31 dias.')
    elseif Config.Framework == 'qbcore' then
        xPlayer.Functions.SetJob(jobInfo.job, jobInfo.grade)
        TriggerClientEvent('QBCore:Notify', xPlayer.source, 'Has recibido el trabajo de taxista durante 31 dias.')
    end
    SetTimeout(60 * 1000, function() -- 1 minuto en milisegundos / SetTimeout(31 * 24 * 60 * 60 * 1000, function() -- 31 días en milisegundos
        if Config.Framework == 'esx' then
            xPlayer.setJob('unemployed', 0)
        elseif Config.Framework == 'qbcore' then
            xPlayer.Functions.SetJob('unemployed', 0)
        end
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Tu trabajo de taxista ha expirado. Se te ha asignado como desempleado nuevamente')
    end)
end
