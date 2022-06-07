QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()
RegisterCommand('anuncios', function()
    local jobname = QBCore.Functions.GetPlayerData().job.name
    if jobname == "police" or jobname == "ambulance" or jobname == "mechanic" then --Aqui puedes ir añadiendo los trabajos.
        SendNUIMessage({
            action = "anuncio",
            presets = presets,
            job = jobname
        })
        SetNuiFocus(true, true)
    end
end)
RegisterNUICallback('exit', function()
    SetNuiFocus(false, false)
end)
RegisterNUICallback('send', function(data)
    TriggerServerEvent('announce:send', data.obj)
end)
RegisterNetEvent('announce:sendForAll', function(data)
    SendNUIMessage({
        action = 'execute',
        content = data
    })
end)
