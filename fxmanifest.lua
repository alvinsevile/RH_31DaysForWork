fx_version 'cerulean'
game 'gta5'

author 'RHScripts'
description 'Asignación de trabajo temporal de 31 días con marker y blip para ESX y QBCore.'
version '1.0.0'

-- Soporte para las últimas versiones de ESX y QBCore
shared_script 'config.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

-- Dependencias de ESX y QBCore
dependencies {
    -- 'es_extended'  -- Si usas ESX
    -- 'qb-core'       -- Si usas QBCore


	'es_extended'
}
